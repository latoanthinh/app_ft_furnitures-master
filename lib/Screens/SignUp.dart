import 'package:flutter/material.dart';
import 'package:furniture/Screens/Login.dart';
import '../services/AuthenticationService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService apiService =
      ApiService('https://api-core.dsp.one/api/auth/user');

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'code': codeController.text.trim(),
        'phone': phoneController.text.trim(),
        'password': passwordController.text.trim(),
      };

      try {
        await apiService.registerUser(userData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đăng ký thành công!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đăng ký thất bại: ${e.toString()}')),
        );
      }
    }
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;

        var tween = Tween<Offset>(begin: begin, end: end);
        var offsetAnimation = tween.animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tạo Tài Khoản',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hãy cùng nhau tạo tài khoản',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildTextField(
                controller: nameController,
                labelText: 'Họ & Tên',
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: emailController,
                labelText: 'Email',
                validator: (value) {
                  final emailRegExp = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email!';
                  } else if (!emailRegExp.hasMatch(value)) {
                    return 'Email không hợp lệ!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: codeController,
                labelText: 'Mã',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mã!';
                  } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Mã chỉ bao gồm chữ số!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: phoneController,
                labelText: 'Số Điện Thoại',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: passwordController,
                labelText: 'Mật Khẩu',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu!';
                  } else if (value.length < 10) {
                    return 'Mật khẩu phải có ít nhất 10 ký tự!';
                  } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])')
                      .hasMatch(value)) {
                    return 'Mật khẩu phải có ít nhất một chữ hoa và một chữ thường!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Đăng Ký',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn Đã Có Tài Khoản?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(_createRoute(LoginPage()));
                      },
                      child: Text(
                        'Đăng Nhập',
                        style: TextStyle(color: Colors.green),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập $labelText!';
            }
            return null;
          },
    );
  }
}
