// ignore: file_names
import 'package:flutter/material.dart';
import 'package:furniture/Screens/Home.dart';

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> todayNotifications = [
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 364.95,
        discountedPrice: 280.00,
        time: "6 phút trước",
        imageUrl: "assets/bangame.png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "9 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "19 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "20 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "21 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "22 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 380.90,
        discountedPrice: 300.00,
        time: "39 phút trước",
        imageUrl: "assets/ban-ghe-cafe.jpg"),
  ];

  final List<NotificationItem> yesterdayNotifications = [
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 280.88,
        discountedPrice: 230.00,
        time: "3 ngày trước",
        imageUrl: "assets/bann.png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 464.95,
        discountedPrice: 399.99,
        time: "4 ngày trước",
        imageUrl: "assets/bann (2).png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 464.95,
        discountedPrice: 399.99,
        time: "5 ngày trước",
        imageUrl: "assets/bann (2).png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 464.95,
        discountedPrice: 399.99,
        time: "8 ngày trước",
        imageUrl: "assets/bann (2).png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 464.95,
        discountedPrice: 399.99,
        time: "10 ngày trước",
        imageUrl: "assets/bann (2).png"),
    NotificationItem(
        title: "Chúng tôi có sản phẩm mới kèm theo ưu đãi",
        originalPrice: 464.95,
        discountedPrice: 399.99,
        time: "20 ngày trước",
        imageUrl: "assets/bann (2).png"),
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Text(
              'Thông Báo',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Xóa hết',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          NotificationSection(
              title: "Hôm Nay", notifications: todayNotifications),
          NotificationSection(
              title: "Hôm Qua", notifications: yesterdayNotifications),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final double originalPrice;
  final double discountedPrice;
  final String time;
  final String imageUrl;

  NotificationItem({
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.time,
    required this.imageUrl,
  });
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationItem> notifications;

  const NotificationSection(
      {super.key, required this.title, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: notifications
              .map((item) => NotificationCard(notification: item))
              .toList(),
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                notification.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    notification.title,
                    style: TextStyle(
                      color: Color(0xFF1A2530),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11.0),
                  child: Row(
                    children: [
                      Text(
                        "\$${notification.originalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "\$${notification.discountedPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              notification.time,
              style: TextStyle(
                color: Color(0xFF707B81),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
