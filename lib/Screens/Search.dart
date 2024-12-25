import 'package:flutter/material.dart';
import 'package:furniture/Screens/Home.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF8F9FB),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              // back to HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          centerTitle: true,
          title: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              border: InputBorder.none,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Searching logic
                
              },
              child: Text(
                'Huỷ',
                style: TextStyle(
                  color: Color(0xFF289E1E),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(13.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm Kiếm Bàn Của Bạn',
                  hintStyle: TextStyle(
                    color: Color(0xFF707B81),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
