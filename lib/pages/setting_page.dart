import 'package:coba_project/account_data.dart';
import 'package:coba_project/main/help_center.dart';
import 'package:coba_project/main/setting_account.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

bool _isTermsExpanded = false;

class _SettingPageState extends State<SettingPage> {
  String username = 'Aloy';
  String email = 'kelompok3@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Profile Card
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF2F6C8D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 40,
                  right: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blueGrey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2F6C8D),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                email,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF2F6C8D),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push<AccountData>(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountSettingPage()),
                              );

                              if (result != null) {
                                setState(() {
                                  username = result.username;
                                  email = result.email;
                                });
                              }
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60), // ✅ Naik dikit biar pas posisi header

            // Menu Items
            _buildMenuItem(
              icon: Icons.support_agent,
              title: 'Help Center',
              subtitle: 'Get quick help from our support team',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpCenterPage(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.description,
              title: 'Terms and Condition',
              subtitle: 'Make sure to review the Terms and Conditions',
              isExpanded: _isTermsExpanded,
              onTap: () {
                setState(() {
                  _isTermsExpanded = !_isTermsExpanded;
                });
              },
              expandedContent: _buildTermsContent(),
            ),

            _buildMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: '',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    bool isExpanded = false, // ✅ tambahkan ini
    Widget? expandedContent, // ✅ tambahkan ini
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Color(0xFF2F6C8D)),
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF2F6C8D),
                ),
              ),
              subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
              textColor: Color(0xFF2F6C8D),
              trailing: Icon(
                color: Colors.orange,
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down, // ✅ icon berubah
                size: 20,
              ),
              onTap: onTap,
            ),
            if (isExpanded && expandedContent != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: expandedContent,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50, // ✅ background abu muda
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Term and Conditions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2F6C8D),
            ),
          ),
          SizedBox(height: 8),
          _buildTermItem(
              '1. Pickup/Return: Return the vehicle on time or face extra charges.'),
          _buildTermItem('2. Driver: Must show valid ID.'),
          _buildTermItem(
              '3. Vehicle Condition: Return in the same condition. Damages will incur fees.'),
          _buildTermItem(
              '4. Extensions: Request before rental ends; additional charges apply.'),
          _buildTermItem(
              '5. Cancellation: 24 hours in advance, only half price refunded.'),
          _buildTermItem(
              '6. Liability: Renter is responsible for any fines or accidents.'),
          _buildTermItem(
              '7. Payment: Full payment required before rental starts.'),
        ],
      ),
    );
  }

  Widget _buildTermItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xFF2F6C8D),
        ),
      ),
    );
  }
}
