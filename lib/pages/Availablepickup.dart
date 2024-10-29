import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/pages/appBar.dart';
import 'package:untitled3/easy_faq.dart';
import 'package:untitled3/pages/myAppointments.dart';

class AvailablePickup extends StatelessWidget {
  const AvailablePickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
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
              title: Text('الرئيسية'), // Home
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailablePickup()), // Navigate to Home (AvailablePickup)
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('جدول مواعيدي'), // Appointments
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAppointments()), // Navigate to MyAppointments
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/backgroundaderha.jpg'), // Set background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'أقرب الطلبات المتاحة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 16), // Add spacing between the title and the list
              OrderCard(
                date: '15/07/2023',
                location: 'San Jose',
                pickupAddress: '8 County Road 11/6, Mannington, WV, 26582, United States',
                deliveryAddress: '1124 Cave Road, Gillette, WV, 26582, United States',
                additionalDetails: {
                  'Estimated Time': '30 mins',
                  'Vehicle': 'Van',
                  'Contact': '+123456789'
                },
              ),
              // Add other OrderCard instances as needed
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ملفي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Color(0xFF157C77),
        unselectedItemColor: Color(0xFF157C77),
        onTap: (index) {
          // Handle navigation if needed
        },
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final String date;
  final String location;
  final String pickupAddress;
  final String deliveryAddress;
  final Map<String, String> additionalDetails;

  const OrderCard({
    Key? key,
    required this.date,
    required this.location,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.additionalDetails,
  }) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping, color: Colors.teal, size: 30),
                SizedBox(width: 8),
                Text(
                  '${widget.date} | ${widget.location}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.pickupAddress,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_pin, color: Colors.red, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.deliveryAddress,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (isExpanded) ...[
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.additionalDetails.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          entry.key == 'Estimated Time'
                              ? Icons.timer
                              : entry.key == 'Vehicle'
                              ? Icons.car_repair
                              : Icons.phone,
                          color: Colors.teal,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${entry.key}: ${entry.value}',
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpanded ? 'أقل' : 'المزيد',
                      style: TextStyle(color: Colors.teal),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.teal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
