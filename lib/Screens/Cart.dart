import 'package:flutter/material.dart';
import 'package:furniture/Screens/HistoryScreen.dart';
import 'package:furniture/Screens/CheckoutScreen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Bàn Cà Phê',
      'size': 'L',
      'price': 64.95,
      'quantity': 1,
      'imageUrl': 'assets/bann.png',
    },
    {
      'name': 'Bàn Làm Việc',
      'size': 'L',
      'price': 64.95,
      'quantity': 1,
      'imageUrl': 'assets/bangame.png',
    },
    {
      'name': 'Bàn Học Tập',
      'size': 'L',
      'price': 64.95,
      'quantity': 1,
      'imageUrl': 'assets/go.png',
    },
    {
      'name': 'Ghế Sofa',
      'size': 'M',
      'price': 120.00,
      'quantity': 1,
      'imageUrl': 'assets/bann.png',
    },
    {
      'name': 'Kệ Sách',
      'size': 'L',
      'price': 85.50,
      'quantity': 1,
      'imageUrl': 'assets/bangame.png',
    },
    {
      'name': 'Bàn Trà',
      'size': 'M',
      'price': 70.00,
      'quantity': 1,
      'imageUrl': 'assets/go.png',
    },
    {
      'name': 'Ghế Xoay',
      'size': 'L',
      'price': 75.00,
      'quantity': 1,
      'imageUrl': 'assets/bann.png',
    },
    {
      'name': 'Tủ Quần Áo',
      'size': 'XL',
      'price': 150.00,
      'quantity': 1,
      'imageUrl': 'assets/bangame.png',
    },
    {
      'name': 'Đèn Bàn',
      'size': 'S',
      'price': 30.00,
      'quantity': 1,
      'imageUrl': 'assets/go.png',
    },
    {
      'name': 'Thảm Sàn',
      'size': 'L',
      'price': 50.00,
      'quantity': 1,
      'imageUrl': 'assets/bann.png',
    },
    {
      'name': 'Bàn Ăn',
      'size': 'XL',
      'price': 200.00,
      'quantity': 1,
      'imageUrl': 'assets/bangame.png',
    },
    {
      'name': 'Ghế Nhựa',
      'size': 'M',
      'price': 20.00,
      'quantity': 1,
      'imageUrl': 'assets/go.png',
    },
    {
      'name': 'Kệ Tivi',
      'size': 'L',
      'price': 90.00,
      'quantity': 1,
      'imageUrl': 'assets/bann.png',
    },
  ];

  double shippingFee = 440.99;

  double get totalPrice {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double get totalCost {
    return totalPrice + shippingFee;
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Giỏ Hàng',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Size: ${item['size']} | \$${item['price'].toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => decreaseQuantity(index),
                                  icon: Icon(Icons.remove_circle_outline,
                                      color: Colors.green),
                                ),
                                Text(
                                  '${item['quantity']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () => increaseQuantity(index),
                                  icon: Icon(Icons.add_circle_outline,
                                      color: Colors.green),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => removeItem(index),
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5.0,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng Cộng',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phí Vận Chuyển',
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    Text('\$${shippingFee.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng Chi Phí',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('\$${totalCost.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Logic thanh toán
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Thanh Toán',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
