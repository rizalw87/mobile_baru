import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E5A72),
        title: Text('Order Details'),
      ),
      body: Center(
        child: Text(
          'Ini halaman detail pesanan',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF2E5A72),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
