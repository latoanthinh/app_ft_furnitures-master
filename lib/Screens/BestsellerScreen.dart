import 'package:flutter/material.dart';

class Bestsellerscreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Bộ bàn ghế gia đình",
      "price": "\$49.6",
      "isHot": true,
      "imageUrl": "assets/bann (2).png"
    },
    {
      "title": "Bàn học",
      "price": "\$41.1",
      "isHot": true,
      "imageUrl": "assets/ghehs.png"
    },
    {
      "title": "Bộ bàn tiệc",
      "price": "\$51.7",
      "isHot": true,
      "imageUrl": "assets/banan.jpg"
    },
    {
      "title": "Ghế sofa",
      "price": "\$52.3",
      "isHot": true,
      "imageUrl": "assets/sofa.png"
    },
  ];
 Bestsellerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), 
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Container(
          color: Color(0xFFF5F5F5), 
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/iconback.png",
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {                
                   Navigator.pop(context);},
                ), 
                Text(
                  'Bán chạy',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/timkiem.png",
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              title: products[index]['title'],
              price: products[index]['price'],
              isHot: products[index]['isHot'],
              imageUrl: products[index]['imageUrl'],
            );
          },
        ),
      ),
     bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 6,
        offset: Offset(0, -3),
      ),
    ],
  ),
  child: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/home.png',
          height: 30,
          width: 30,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/favourite.png',
          height: 30,
          width: 30,
          color: Colors.green, 
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/chuong.png',
          height: 30,
          width: 30,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/user.png',
          height: 30,
          width: 30,
        ),
        label: '',
      ),
    ],
    currentIndex: 1,
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
),

    );
  }
}
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final bool isHot;
  final String imageUrl;

  const ProductCard({super.key, 
    required this.title,
    required this.price,
    required this.isHot,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0), 
        borderRadius: BorderRadius.circular(16), 
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), 
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isHot)
                  Text(
                    'BÁN CHẠY',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
  padding: const EdgeInsets.only(right: 15.0, bottom: 15.0), 
  child: Align(
    alignment: Alignment.bottomRight, 
    child: Image.asset(
      'assets/tym.png', 
      height: 25, 
      width: 25, 
    ),
  ),
),
        ],
      ),
    );
  }
}