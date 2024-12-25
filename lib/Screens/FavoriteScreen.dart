import 'package:flutter/material.dart';
import 'package:furniture/Screens/Home.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Lmao",
      "price": "\$58.7",
      "isHot": true,
      "imageUrl": "assets/ban-ghe-cafe.jpg"
    },
    {
      "title": "Bàn gaming",
      "price": "\$37.8",
      "isHot": true,
      "imageUrl": "assets/bangame.png"
    },
    {
      "title": "Bàn gỗ",
      "price": "\$47.7",
      "isHot": true,
      "imageUrl": "assets/go.png"
    },
    {
      "title": "Bàn đa năng",
      "price": "\$57.6",
      "isHot": true,
      "imageUrl": "assets/bann.png"
    },
    {
      "title": "Bàn đa năng",
      "price": "\$57.6",
      "isHot": true,
      "imageUrl": "assets/go.png"
    },
    {
      "title": "Bàn đa năng",
      "price": "\$57.6",
      "isHot": true,
      "imageUrl": "assets/ban-ghe-cafe.jpg"
    },
    {
      "title": "Bàn đa năng",
      "price": "\$57.6",
      "isHot": true,
      "imageUrl": "assets/bann.png"
    },
    {
      "title": "Bàn đa năng",
      "price": "\$57.6",
      "isHot": true,
      "imageUrl": "assets/go.png"
    },
  ];

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SizedBox(
          height: 90, 
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  Text(
                    'Yêu Thích',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/heart.png",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 5,
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
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final bool isHot;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.isHot,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
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
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Image.asset(
                      'assets/tym.png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
