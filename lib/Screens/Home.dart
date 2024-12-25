import 'package:flutter/material.dart';
import 'package:furniture/Screens/Cart.dart';
import 'package:furniture/Screens/FavoriteScreen.dart';
import 'package:furniture/Screens/NotificationScreen.dart';
import 'package:furniture/model/Product.dart';
import 'package:furniture/Screens/Detail.dart';
import 'package:furniture/Screens/Profile.dart';
import 'package:furniture/Screens/Search.dart';
import 'package:furniture/services/AuthenticationService.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final ApiService _apiService =
      ApiService('https://api-core.dsp.one/api/client/product');

  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    try {
      final data = await _apiService.fetchProducts();
      return data;
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  final List<Widget> _pages = [
    HomeScreen(products: []),
    FavoriteScreen(),
    NotificationScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: _currentIndex == 0
          ? FutureBuilder<List<Product>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }
                return HomeScreen(products: snapshot.data!);
              },
            )
          : _pages[_currentIndex],
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF289E1E),
      unselectedItemColor: Colors.grey,
      onTap: _onBottomNavTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.white),
                accountName: const Text(
                  "Hồ Trọng Toàn",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                accountEmail: const Text(
                  "toan@gmail.com",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 234, 234, 234),
                  child: Text("T",
                      style: TextStyle(fontSize: 40.0, color: Colors.green)),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Trang Chủ'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài Đặt'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Trợ Giúp'),
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Đăng Xuất', style: TextStyle(color: Colors.red)),
              onTap: () async {
                try {
                  await _apiService.logoutUser();
                  Navigator.pushReplacementNamed(context, '/login');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng xuất thất bại: $e')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products;

  const HomeScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          _buildHeader(context),
          _buildSearchSection(),
          _buildCategoryList(),
          _buildProductGrid(context),
          _buildProductGrid_2(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Vị trí cửa hàng',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              Text(
                'Trần Hưng Đạo, Q1',
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search for furniture...',
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      'assets/Images/desk1.png',
      'assets/Images/chair.png',
      'assets/Images/fan.png',
      'assets/Images/light.png',
      'assets/Images/bed.png',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCategoryItem(category),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String imageAsset) {
    return Column(
      children: [
        Container(
          width: 64.0,
          height: 64.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 3),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(imageAsset),
          ),
        ),
        const SizedBox(height: 18.0),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bàn phổ biến',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF289E1E)),
          ),
          Container(
            height: 370,
            child: GridView.count(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: products.map((product) {
                return _buildProductItem(context, product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(product: product)),
        );
      },
      child: Container(
        width: 157.0,
        height: 203.0,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.thumbnail,
                width: 157.0,
                height: 110.0,
                fit: BoxFit.cover,
              ),
              Text(
                product.name,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF1A2530),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid_2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bàn Mới',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF289E1E)),
          ),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: _buildProductItem_2(context, product),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem_2(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(product: product)),
        );
      },
      child: Container(
        width: 320.0,
        height: 118.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Color(0xff289E1E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF1A2530),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF1A2530),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  product.thumbnail,
                  fit: BoxFit.cover,
                  height: 78.0,
                  width: 130.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
