import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBBD8D6), // Light beige background color to match your design
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumn(
                [
                  _buildLink('شروط الاستخدام'),
                  _buildLink('سياسة الخصوصية'),
                  _buildLink('تواصل معنا'),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('شروطنا'),
                  _buildLink('شروط الاستخدام'),
                  _buildLink('سياسة الخصوصية'),
                  _buildLink('تواصل معنا'),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('سياساتنا'),
                  _buildLink('شروط الاستخدام'),
                  _buildLink('سياسة الخصوصية'),
                  _buildLink('تواصل معنا'),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('المساعدة والدعم'),
                  _buildLink('اتصل بنا'),
                  _buildLink('المساعدة والدعم'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              '© 2024 ADERHA. جميع الحقوق محفوظة.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(List<Widget> children) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
