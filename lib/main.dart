import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Internet/NoInternetBuilder.dart';
import 'package:furniture/Screens/BestsellerScreen.dart';
import 'package:furniture/Screens/Cart.dart';
import 'package:furniture/Screens/Detail.dart';
import 'package:furniture/Screens/Evaluation.dart';
import 'package:furniture/Screens/FavoriteScreen.dart';
import 'package:furniture/Screens/HistoryScreen.dart';
import 'package:furniture/Screens/Login.dart';
import 'package:furniture/Screens/NotificationScreen.dart';
import 'package:furniture/Screens/Search.dart';
import 'package:furniture/Screens/SignUp.dart';
import 'package:furniture/Screens/Splash.dart';
import 'package:furniture/Screens/Profile.dart';
import 'Screens/Home.dart';
import 'Screens/CheckoutScreen.dart';
import 'model/Product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master',
      initialRoute: '/splash',
      routes: {
        //cuonglmao
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => ProfilePage(),
        // Thinh
        '/home': (context) => HomePage(),
        '/about': (context) => NoInternetScreen(),
        '/detail': (context) => DetailPage(
            product: Product(
                name: 'Product 1',
                slug: '',
                price: 0.0,
                description: "",
                thumbnail: 'assets/Images/desk1.png')),
        '/cart': (context) => CartPage(),
        // Quoc
        '/favourite': (context) => FavoriteScreen(),
        '/notification': (context) => NotificationScreen(),
        '/bestseller': (context) => Bestsellerscreen(),
        '/history': (context) => HistoryScreen(),
        // Khoa
        '/evaluation': (context) => EvaluationScreen(),
        '/checkoutScreen': (context) => CheckoutScreen(),
        // Nam
        '/search': (context) => SearchPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown Page'),
      ),
      body: Center(
        child: Text('This page does not exist.'),
      ),
    );
  }
}
