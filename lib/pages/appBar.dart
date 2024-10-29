import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "محمد علي الشهري",
            style: TextStyle(fontSize: 18, color: Colors.teal),
          ),
          SizedBox(width: 10),
          Text(
            'مرحباً بعودتك!',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: Colors.grey[600]),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Add any action on tapping the logo
          },
          child: Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/AderhaIcon2.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الرئيسية'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/'); // Navigate to home
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('جدول مواعيدي'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/appointments'); // Navigate to MyAppointments
            },
          ),
          // Add other drawer items as needed
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
