import 'package:flutter/material.dart';
import 'package:furniture/Screens/Home.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage('assets/anhghebanh.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ghế Bành',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'L | \$64.95',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    IconButton(
                      onPressed: decrementQuantity,
                      icon: Image.asset(
                        'assets/icons/icontru.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      onPressed: incrementQuantity,
                      icon: Image.asset(
                        'assets/icons/iconcong.png',
                        width: 24,
                        height: 24,
                      ),
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

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String email = 'rumenhussen@gmail.com';
  String phoneNumber = '+84-692-764-269';
  double totalCost = 1250.00;
  double shippingFee = 40.90;

  void _showPaymentSuccessDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/bravo.png',
                width: 80,
                height: 80,
              ),
              SizedBox(height: 10),
              Text(
                'Thanh Toán Thành Công!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Tiếp Tục Mua Sắm',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _editContactInfo() async {
    final result = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        String newEmail = email;
        String newPhone = phoneNumber;

        return AlertDialog(
          title: Text('Chỉnh Sửa Thông Tin Liên Hệ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => newEmail = value,
                controller: TextEditingController(text: email),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Số điện thoại'),
                onChanged: (value) => newPhone = value,
                controller: TextEditingController(text: phoneNumber),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop([newEmail, newPhone]);
              },
              child: Text('Lưu'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );

    if (result != null && result.length == 2) {
      setState(() {
        email = result[0];
        phoneNumber = result[1];
      });
    }
  }

  void _editCosts() async {
    final result = await showDialog<List<double>>(
      context: context,
      builder: (context) {
        double newTotalCost = totalCost;
        double newShippingFee = shippingFee;

        return AlertDialog(
          title: Text('Chỉnh Sửa Chi Phí'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Tổng Chi Phí'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    newTotalCost = double.tryParse(value) ?? totalCost,
                controller: TextEditingController(text: totalCost.toString()),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Phí Giao Hàng'),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    newShippingFee = double.tryParse(value) ?? shippingFee,
                controller: TextEditingController(text: shippingFee.toString()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop([newTotalCost, newShippingFee]);
              },
              child: Text('Lưu'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Hủy'),
            ),
          ],
        );
      },
    );

    if (result != null && result.length == 2) {
      setState(() {
        totalCost = result[0];
        shippingFee = result[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildContactInfoSection(),
            SizedBox(height: 16.0),
            _buildAddressSection(),
            SizedBox(height: 16.0),
            _buildPaymentMethodSection(),
            SizedBox(height: 16.0),
            _buildNotesSection(),
            SizedBox(height: 16.0),
            _buildOrderSummarySection(),
            SizedBox(height: 16.0),
            _buildTotalCostSection(),
            SizedBox(height: 8.0),
            _buildCheckoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return _buildSectionContainer(
      title: 'Thông Tin Liên Hệ',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactRow(
            icon: 'assets/icons/iconemail.png',
            label: email,
            subLabel: 'Email',
            onTap: _editContactInfo,
          ),
          _buildContactRow(
            icon: 'assets/icons/icondienthoai.png',
            label: phoneNumber,
            subLabel: 'Số điện thoại',
            onTap: _editContactInfo,
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required String icon,
    required String label,
    required String subLabel,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(icon, width: 24, height: 24),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(subLabel),
            ],
          ),
          Spacer(),
          Image.asset('assets/icons/Iconbutchi.png', width: 24, height: 24),
        ],
      ),
    );
  }

  Widget _buildAddressSection() {
    return _buildSectionContainer(
      title: 'Địa Chỉ',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '37 Cao Văn Lầu p1 quận6',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/icons/anhmap.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return _buildSectionContainer(
      title: 'Phương Thức Thanh Toán',
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset('assets/icons/momo.png', width: 32, height: 32),
          ),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ví điện tử Momo', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 4.0),
              Text('**** **** 0696 4629',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return _buildSectionContainer(
      title: 'Ghi Chú',
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Bạn cần ghi gì thì viết vào đây....!!!',
          border: InputBorder.none,
        ),
        maxLines: null,
      ),
    );
  }

  Widget _buildOrderSummarySection() {
    return _buildSectionContainer(
      title: 'Đơn Hàng',
      child: Column(
        children: [
          ProductWidget(),
          ProductWidget(),
        ],
      ),
    );
  }

  Widget _buildTotalCostSection() {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCostRow('Tổng Chi Phí', '\$${totalCost.toStringAsFixed(2)}',
              onTap: _editCosts),
          _buildCostRow('Phí Giao Hàng', '\$${shippingFee.toStringAsFixed(2)}',
              onTap: _editCosts),
          _buildCostRow(
            'Tổng Cộng',
            '\$${(totalCost + shippingFee).toStringAsFixed(2)}',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(String title, String amount,
      {bool isBold = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            amount,
            style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return ElevatedButton(
      onPressed: () {
        _showPaymentSuccessDialog(context);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Text('Thanh Toán',
          style: TextStyle(fontSize: 16.0, color: Colors.white)),
    );
  }

  Widget _buildSectionContainer({String? title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0x00ffffff),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
          ],
          child,
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckoutScreen(),
  ));
}
