import 'package:flutter/material.dart';
import 'package:furniture/model/Product.dart';
import 'package:furniture/Screens/Home.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bàn Làm Việc là một thiết kế đơn giản phong cách hiện đại, phù hợp với nhiều không gian.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Đánh Giá (200)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Xem tất cả',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF289E1E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            _buildReviewCard(
                'Toàn Thịnh',
                'Đã sử dụng hơn 2 năm, rất hài lòng với sản phẩm!',
                5,
                'assets/icons/avatarmacdinh.jpg'),
            _buildReviewCard(
                'Văn Cường',
                'Sản phẩm đẹp, chất lượng tốt, dịch vụ nhanh chóng!',
                4,
                'assets/icons/avatarmacdinh.jpg'),
            _buildReviewCard(
                'Văn Cường',
                'Sản phẩm đẹp, chất lượng tốt, dịch vụ nhanh chóng!',
                4,
                'assets/icons/avatarmacdinh.jpg'),
            _buildReviewCard(
                'Văn Cường',
                'Sản phẩm đẹp, chất lượng tốt, dịch vụ nhanh chóng!',
                4,
                'assets/icons/avatarmacdinh.jpg'),
            _buildReviewCard(
                'Văn Cường',
                'Sản phẩm đẹp, chất lượng tốt, dịch vụ nhanh chóng!',
                4,
                'assets/icons/avatarmacdinh.jpg'),
            _buildReviewCard(
                'Văn Cường',
                'Sản phẩm đẹp, chất lượng tốt, dịch vụ nhanh chóng!',
                4,
                'assets/icons/avatarmacdinh.jpg'),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Thêm Vào Giỏ Hàng',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(
      String reviewer, String comment, int rating, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: null,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewer,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    SizedBox(height: 4),
                    Text(
                      comment,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
