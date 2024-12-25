import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  late Stream<ConnectivityResult> _connectivityStream;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivityStream =
        Connectivity().onConnectivityChanged as Stream<ConnectivityResult>;
    _checkInitialConnection();
  }

  void _checkInitialConnection() async {
    var result = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: _connectivityStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _isConnected = snapshot.data != ConnectivityResult.none;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(""),
          ),
          body: _isConnected
              ? Center(child: Text('Đang online'))
              : Center(child: Text('Không hiển thị ,vui lòng kết nối lại')),
        );
      },
    );
  }
}
