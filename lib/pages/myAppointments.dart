import 'package:flutter/material.dart';
import 'package:untitled3/pages/appBar.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "أدرها",
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
            Spacer(),
            Text(
              'جدول مواعيدي',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            AppointmentCard(
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
            AppointmentCard(
              date: '18/07/2023',
              location: 'Los Angeles',
              pickupAddress: '1234 Sunset Blvd, Los Angeles, CA, 90026, United States',
              deliveryAddress: '9876 Ocean Ave, Santa Monica, CA, 90405, United States',
              additionalDetails: {
                'Estimated Time': '45 mins',
                'Vehicle': 'Truck',
                'Contact': '+987654321'
              },
            ),
            AppointmentCard(
              date: '20/07/2023',
              location: 'New York',
              pickupAddress: '456 Manhattan Ave, New York, NY, 10026, United States',
              deliveryAddress: '789 Queens Blvd, Queens, NY, 11375, United States',
              additionalDetails: {
                'Estimated Time': '25 mins',
                'Vehicle': 'Motorcycle',
                'Contact': '+1122334455'
              },
            ),
            AppointmentCard(
              date: '22/07/2023',
              location: 'Miami',
              pickupAddress: '789 Ocean Drive, Miami, FL, 33139, United States',
              deliveryAddress: '321 Beach Ave, Miami Beach, FL, 33139, United States',
              additionalDetails: {
                'Estimated Time': '40 mins',
                'Vehicle': 'Sedan',
                'Contact': '+5544332211'
              },
            ),
            AppointmentCard(
              date: '24/07/2023',
              location: 'Houston',
              pickupAddress: '101 Main St, Houston, TX, 77002, United States',
              deliveryAddress: '202 Westheimer Rd, Houston, TX, 77006, United States',
              additionalDetails: {
                'Estimated Time': '35 mins',
                'Vehicle': 'SUV',
                'Contact': '+6677889900'
              },
            ),
          ],
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
          // Handle navigation
        },
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String date;
  final String location;
  final String pickupAddress;
  final String deliveryAddress;
  final Map<String, String> additionalDetails;

  const AppointmentCard({
    Key? key,
    required this.date,
    required this.location,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.additionalDetails,
  }) : super(key: key);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
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
            // Appointment summary with icon, date, and location
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
            // Pickup and delivery address with icons
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
            // Expandable section for additional details
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
