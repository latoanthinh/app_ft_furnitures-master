import 'package:flutter/material.dart';

class EvaluationScreen extends StatelessWidget {
  final List<EvaluationItem> evaluations = [
    EvaluationItem(
      userName: "Nam Trần",
      profileImageUrl: "assets/icons/avatarmacdinh.jpg",
      rating: 5,
      description: "Sản phẩm rất tốt, tôi rất hài lòng với chất lượng!",
    ),
    EvaluationItem(
      userName: "Hữu Rô",
      profileImageUrl: "assets/icons/avatarmacdinh.jpg",
      rating: 4,
      description:
          "Chất lượng sản phẩm tốt, nhưng thời gian giao hàng có hơi lâu.",
    ),
    EvaluationItem(
      userName: "Toàn Thịnh",
      profileImageUrl: "assets/icons/avatarmacdinh.jpg",
      rating: 5,
      description: "Bàn ghế rất chắc chắn, thiết kế đẹp và tiện dụng.",
    ),
    EvaluationItem(
      userName: "Trọng Toàn",
      profileImageUrl: "assets/icons/avatarmacdinh.jpg",
      rating: 3,
      description:
          "Mua để trang trí phòng khách, rất ưng ý với kiểu dáng hiện đại.",
    ),
    EvaluationItem(
      userName: "Quốc Nam",
      profileImageUrl: "assets/icons/avatarmacdinh.jpg",
      rating: 5,
      description:
          "Rất vừa vặn cho phòng làm việc, dễ dàng di chuyển và dọn dẹp.",
    ),
  ];

  EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Đánh Giá',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/Iconnutthoat.png',
            height: 40,
            width: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: evaluations.length,
          itemBuilder: (context, index) {
            return EvaluationCard(evaluation: evaluations[index]);
          },
        ),
      ),
    );
  }
}

class EvaluationItem {
  final String userName;
  final String profileImageUrl;
  final int rating;
  final String description;

  EvaluationItem({
    required this.userName,
    required this.profileImageUrl,
    required this.rating,
    required this.description,
  });

  int get safeRating => rating > 5 ? 5 : rating;
}

class EvaluationCard extends StatelessWidget {
  final EvaluationItem evaluation;

  const EvaluationCard({super.key, required this.evaluation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    evaluation.profileImageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      evaluation.userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: List.generate(evaluation.safeRating, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        );
                      }),
                    ),
                    SizedBox(height: 8),
                    Text(
                      evaluation.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
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

void main() {
  runApp(MaterialApp(
    home: EvaluationScreen(),
  ));
}
