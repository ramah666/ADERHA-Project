import 'package:flutter/material.dart';
import 'package:untitled3/pages/footer.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 25,
                            child: Icon(Icons.person, size: 40, color: Colors.teal),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'محمد علي الشهري',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Image.asset(
                        'assets/icons/AderhaIcon2.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildListTile(context, 'معلومات الملف الشخصي', Icons.person, ProfilePage()),
                  _buildListTile(context, 'الإشعارات', Icons.notifications, NotificationsPage()),
                  _buildListTile(context, 'اللغة', Icons.language, LanguagePage()),
                  _buildListTile(context, 'الإعدادات', Icons.settings, SettingsPage()),
                  _buildListTile(context, 'الأسئلة الشائعة', Icons.help, FAQPage()),
                  _buildListTile(context, 'سياسة الخصوصية', Icons.privacy_tip, PrivacyPolicyPage()),
                  _buildListTile(context, 'الأحكام والشروط', Icons.article, TermsAndConditionsPage()),
                  _buildLogoutTile(context),
                ],
              ),
              Footer(), // Footer now scrolls with the page content
            ],
          ),
        ),
        bottomNavigationBar: _buildNavigationButtons(context),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, Widget page) {
    return Align(
      alignment: Alignment.centerRight,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: TextStyle(fontSize: 18)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text(
          'تسجيل الخروج',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color(0xFF157C77)),
          label: 'ملفي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list, color: Color(0xFF157C77)),
          label: 'طلباتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xFF157C77)),
          label: 'الرئيسية',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyRequestsPage()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
        }
      },
    );
  }
}

// Placeholder page classes
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('معلومات الملف الشخصي')),
      body: Center(child: Text('معلومات الملف الشخصي')),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإشعارات')),
      body: Center(child: Text('الإشعارات')),
    );
  }
}

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اللغة')),
      body: Center(child: Text('اختر لغتك المفضلة')),
    );
  }
}

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الأسئلة الشائعة')),
      body: Center(child: Text('أسئلة شائعة')),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('سياسة الخصوصية')),
      body: Center(child: Text('سياسة الخصوصية')),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الأحكام والشروط')),
      body: Center(child: Text('الأحكام والشروط')),
    );
  }
}

class MyRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلباتي')),
      body: Center(child: Text('طلبات المستخدم')),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الرئيسية')),
      body: Center(child: Text('الصفحة الرئيسية')),
    );
  }
}
