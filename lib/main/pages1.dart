import 'package:flutter/material.dart';

class Pages1 extends StatefulWidget {
  const Pages1({super.key});

  @override
  State<Pages1> createState() => _Pages1State();
}

class _Pages1State extends State<Pages1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages 1'),
      ),
      body: Center(
        child: Text(
          'Welcome to Pages 1!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
