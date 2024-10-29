import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedIndex = 2; // Default to 'طلبياتي' (My Orders)
  bool isCurrentOrders = true; // Track whether current orders or completed orders are shown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/backgroundaderha.jpg'), // Your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Add SizedBox for space at the top
            SizedBox(height: 20), // Adjust the height as needed

            // Row for buttons to switch between current and completed orders
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150, // Set a specific width for uniformity
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCurrentOrders = true; // Show current orders
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Makes the button rectangle
                      ),
                      backgroundColor: isCurrentOrders ? Colors.teal : Colors.white, // Background color
                      foregroundColor: isCurrentOrders ? Colors.white : Colors.black, // Text color
                    ),
                    child: const Text('الطلبات الحالية'), // Current Orders
                  ),
                ),
                Container(
                  width: 150, // Set a specific width for uniformity
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCurrentOrders = false; // Show completed orders
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Makes the button rectangle
                      ),
                      backgroundColor: !isCurrentOrders ? Colors.teal : Colors.white, // Background color
                      foregroundColor: !isCurrentOrders ? Colors.white : Colors.black, // Text color
                    ),
                    child: const Text('الطلبات السابقة'), // Previous Orders
                  ),
                ),
              ],
            ),
            // Expanded widget to hold the orders list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: isCurrentOrders
                    ? [
                  OrderCard(
                    status: 'جاري الاستلام',
                    orderNumber: '#00005436',
                    date: '21/9/2024',
                    time: '13:00 PM - 16:00 PM',
                    items: [
                      'ورق: 20 كلب',
                      'كرتون: 40 كرتون',
                      'عبوة معدنية: 30 عبلة',
                    ],
                    location: 'موقع الاستلام: العمل - السليمانية - جدة, 22254',
                  ),
                  OrderCard(
                    status: 'جاري الاستلام',
                    orderNumber: '#00005437',
                    date: '22/9/2024',
                    time: '09:00 AM - 11:00 AM',
                    items: [
                      'سماعات: 5 وحدات',
                      'كرتون: 10 كرتون',
                    ],
                    location: 'موقع الاستلام: حي الصفا - جدة, 22333',
                  ),
                  OrderCard(
                    status: 'جاري الاستلام',
                    orderNumber: '#00005438',
                    date: '23/9/2024',
                    time: '12:00 PM - 15:00 PM',
                    items: [
                      'شاشات: 2 وحدة',
                      'سماعات: 10 وحدات',
                    ],
                    location: 'موقع الاستلام: حي الروضة - جدة, 22444',
                  ),
                ]
                    : [
                  OrderCard(
                    status: 'مكتمل',
                    orderNumber: '#00005479',
                    date: '24/10/2024',
                    time: '16:00 PM - 20:00 PM',
                    items: [
                      'عبوة معدنية: 30 كرتون',
                    ],
                    location: 'موقع التسليم: حي النعيم - جدة, 22322',
                  ),
                  OrderCard(
                    status: 'مكتمل',
                    orderNumber: '#00005480',
                    date: '25/10/2024',
                    time: '15:00 PM - 18:00 PM',
                    items: [
                      'مستحضرات تجميل: 50 كرتون',
                    ],
                    location: 'موقع التسليم: حي السليمانية - جدة, 22254',
                  ),
                  OrderCard(
                    status: 'مكتمل',
                    orderNumber: '#00005481',
                    date: '26/10/2024',
                    time: '10:00 AM - 12:00 PM',
                    items: [
                      'أدوات كهربائية: 20 كرتون',
                    ],
                    location: 'موقع التسليم: حي الأندلس - جدة, 22555',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ملفي', // Profile
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'تعلم', // Learn
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'طلبياتي', // My Orders
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية', // Home
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF157C77), // Color of the selected item
        unselectedItemColor: Color(0xFF157C77), // Color of unselected items
        backgroundColor: Color(0xFF157C77), // Background color for the bottom nav bar
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });

          // Implement navigation based on the selected index
          switch (index) {
            case 0:
            // Navigate to Profile page
              break;
            case 1:
            // Navigate to Learn page
              break;
            case 2:
            // Stay on My Orders page (this page)
              break;
            case 3:
            // Navigate to Home page
              break;
          }
        },
      ),
    );
  }
}

class CurrentOrdersTab extends StatelessWidget {
  const CurrentOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        OrderCard(
          status: 'جاري الاستلام',
          orderNumber: '#00005436',
          date: '21/9/2024',
          time: '13:00 PM - 16:00 PM',
          items: [
            'ورق: 20 كلب',
            'كرتون: 40 كرتون',
            'عبوة معدنية: 30 عبلة',
          ],
          location: 'موقع الاستلام: العمل - السليمانية - جدة, 22254',
        ),
        // Additional OrderCard instances can be added here
      ],
    );
  }
}

class CompletedOrdersTab extends StatelessWidget {
  const CompletedOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        OrderCard(
          status: 'مكتمل',
          orderNumber: '#00005479',
          date: '24/10/2024',
          time: '16:00 PM - 20:00 PM',
          items: [
            'عبوة معدنية: 30 كرتون',
          ],
          location: 'موقع التسليم: حي النعيم - جدة, 22322',
        ),
        // Additional OrderCard instances can be added here
      ],
    );
  }
}

class OrderCard extends StatefulWidget {
  final String status;
  final String orderNumber;
  final String date;
  final String time;
  final List<String> items;
  final String location;

  const OrderCard({
    Key? key,
    required this.status,
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.items,
    required this.location,
  }) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.status, style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                Text(widget.orderNumber, style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(height: 8),
            Text('التاريخ: ${widget.date}', textAlign: TextAlign.right), // Align text to the right
            Text('الوقت: ${widget.time}', textAlign: TextAlign.right), // Align text to the right
            SizedBox(height: 8),
            Text(
              'المحتلفات:',
              style: TextStyle(decoration: TextDecoration.underline, color: Colors.teal),
              textAlign: TextAlign.right, // Align text to the right
            ),
            if (isExpanded) ...widget.items.map((item) => Text('- $item', textAlign: TextAlign.right)).toList(), // Align text to the right
            if (isExpanded) ...[
              SizedBox(height: 8),
              Text(widget.location, textAlign: TextAlign.right), // Align text to the right
            ],
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'عرض تفاصيل أقل للطلب' : 'عرض تفاصيل أكثر للطلب',
                style: TextStyle(color: Colors.teal),
                textAlign: TextAlign.right, // Align text to the right
              ),
            ),
          ],
        ),
      ),
    );
  }
}
