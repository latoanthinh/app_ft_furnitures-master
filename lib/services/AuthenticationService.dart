import 'package:furniture/model/Product.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

class ApiService {
  final String baseUrl;
  static String? _authToken; // Thêm thuộc tính token

  ApiService(this.baseUrl);

//lưu token vào biến tĩnh
  void _savedToken(String token) {
    _authToken = token;
    print('token saved: $_authToken');
  }

  String? getToken() {
    return _authToken;
  }

  void clearToken() {
    _authToken = null;
    print('token cleared: $_authToken');
  }

  // Đăng Ký
  Future<void> registerUser(Map<String, dynamic> userData) async {
    final response = await https.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register user: ${response.body}');
    }
  }

  // Đăng nhập
  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) async {
    final response = await https.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['token'] != null) {
        _savedToken(data['token']); //lưu biến tĩnh
      }
      String message = data['message'] ?? 'Login successful';
      return data;
    } else {
      final errorData = json.decode(response.body);
      throw Exception(
          'Failed to login: ${errorData['message'] ?? 'Unknown error'}');
    }
  }

  // Đăng xuất
  Future<void> logoutUser() async {
    try {
      if (_authToken == null) {
        throw Exception('Người dùng chưa đăng nhập');
      }

      final response = await https.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $_authToken',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to logout: ${response.body}');
      }
      clearToken(); // Xóa token
    } catch (e) {
      throw Exception('System error during logout: $e');
    }
  }

  Future<void> ensureToken() async {
    if (getToken() == null) {
      throw Exception('người dùng chưa đăng nhập');
    }
  }

  Future<List<Product>> fetchProducts() async {
    try {
      await ensureToken();

      final response = await https.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = json.decode(response.body);

        if (decoded['data'] != null && decoded['data']['data'] is List) {
          List<dynamic> productsData = decoded['data']['data'];

          return productsData.map((item) {
            return Product(
              name: item['name'] is String ? item['name'] : 'Unknown',
              slug: item['slug'] is String ? item['slug'] : 'unknown-slug',
              description: item['description'] is String
                  ? item['description']
                  : 'No description available',
              price: (item['price'] is num)
                  ? (item['price'] as num).toDouble()
                  : 0.0,
              thumbnail: item['thumbnail'] is String
                  ? item['thumbnail']
                  : 'assets/Images/desk1.png',
            );
          }).toList();
        } else {
          throw Exception('Data is not a list');
        }
      } else {
        final errorData = json.decode(response.body);
        String errorMessage = errorData['message'] ?? 'Failed to load products';
        throw Exception('Failed to load products: $errorMessage');
      }
    } catch (e) {
      throw Exception('Lỗi hệ thống:>>>>>>>>> $e');
    }
  }

  Future<Map<String, dynamic>> fetchUserProfile(int userId) async {
    final response =
        await https.get(Uri.parse('$baseUrl/user/user-profile/$userId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      final errorData = json.decode(response.body);
      throw Exception(
          'Failed to load user profile: ${errorData['message'] ?? 'Unknown error'}');
    }
  }
}
