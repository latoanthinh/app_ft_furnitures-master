import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<History> historyItems = [
    History(
      orderId: "#92277157",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đóng Gói",
      time: "3 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#22287157",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đang Giao",
      time: "4 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#92287117",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "3 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#92287555",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "1 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
    History(
      orderId: "#12345678",
      deliveryType: "Giao Hàng Nhanh",
      status: "Đang Giao",
      time: "2 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#87654321",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "5 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#11223344",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đã Huỷ",
      time: "1 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#22334455",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đang Giao",
      time: "2 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
    History(
      orderId: "#33445566",
      deliveryType: "Giao Hàng Nhanh",
      status: "Giao Thành Công",
      time: "3 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#44556677",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đang Giao",
      time: "4 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#55667788",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "1 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#66778899",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đóng Gói",
      time: "5 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
    History(
      orderId: "#77889900",
      deliveryType: "Giao Hàng Nhanh",
      status: "Đang Giao",
      time: "3 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#88990011",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "2 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#99001122",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đã Huỷ",
      time: "1 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#10111213",
      deliveryType: "Giao Hàng Nhanh",
      status: "Giao Thành Công",
      time: "2 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
    History(
      orderId: "#13141516",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đang Giao",
      time: "3 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#16171819",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "4 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#19202122",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đóng Gói",
      time: "1 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#22232425",
      deliveryType: "Giao Hàng Nhanh",
      status: "Đang Giao",
      time: "6 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
    History(
      orderId: "#25262728",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Giao Thành Công",
      time: "3 sản phẩm",
      imageUrl: "assets/bann.png",
    ),
    History(
      orderId: "#28293031",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đã Huỷ",
      time: "2 sản phẩm",
      imageUrl: "assets/bangame.png",
    ),
    History(
      orderId: "#31323334",
      deliveryType: "Giao Hàng Nhanh",
      status: "Giao Thành Công",
      time: "5 sản phẩm",
      imageUrl: "assets/go.png",
    ),
    History(
      orderId: "#34353637",
      deliveryType: "Giao Hàng Tiêu Chuẩn",
      status: "Đang Giao",
      time: "1 sản phẩm",
      imageUrl: "assets/bann (2).png",
    ),
  ];

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              'Lịch Sử',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(width: 48),
          ],
        ),
        elevation: 0,
      ),
      body: ListView(
        children:
            historyItems.map((item) => HistoryCard(history: item)).toList(),
      ),
    );
  }
}

class History {
  final String orderId;
  final String deliveryType;
  final String status;
  final String time;
  final String imageUrl;

  History({
    required this.orderId,
    required this.deliveryType,
    required this.status,
    required this.time,
    required this.imageUrl,
  });
}

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({super.key, required this.history});

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
                history.imageUrl,
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
                    "Đơn hàng ${history.orderId}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    history.deliveryType,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    history.status,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              history.time,
              style: TextStyle(
                color: Color(0xFF707B81),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
