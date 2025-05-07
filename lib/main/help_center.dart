import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Help Center'),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF2F6C8D),
      ),
      body: Column(
        children: [
          // 🔵 Bagian biru lengkung
          Container(
            height: 64, // agak tinggi biar lengkungnya mantap
            decoration: BoxDecoration(
              color: Color(0xFF2F6C8D),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
          ),

          SizedBox(height: 40), // jarak antara biru dan kotak service

          // 🟦 Border Customer Service
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
              ),
              child: ListTile(
                leading: Text(
                  'Customer Service',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.call, color: Colors.orange),
                    SizedBox(width: 18),
                    Icon(Icons.message, color: Colors.orange),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
