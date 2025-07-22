import 'package:flutter/material.dart';
import 'package:websiteschool/Component/aboutuscomp.dart';
import 'package:websiteschool/Component/footer.dart';
import '../Component/responsive.dart';

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({super.key});

  @override
  State<Aboutuspage> createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = Responsive.isMobile(context);
    //hello

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: isMobile
          ? Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image.asset('asset/logo.png'),
              ),
              _drawerNavItem("HOME", () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, 'dashboard');
              }),
              _drawerNavItem("ABOUT", () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'about');
              }),
              _drawerNavItem("GALLERY", () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'gallery');
              }),
              _drawerNavItem("CONTACT", () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'contact');
                // Add this when Contact route is ready
                // Navigator.pushNamed(context, 'contact');
              }),
            ],
          ),
        ),
      )
          : null,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/banner2.jpg'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Navbar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('asset/logo.png', height: 40),
                      if (!isMobile)
                        Row(
                          children: [
                            _navText("HOME", () => Navigator.pushReplacementNamed(context, 'dashboard')),
                            _navText("ABOUT", () => Navigator.pushReplacementNamed(context, 'about'),isActive: true),
                            _navText("GALLERY", () => Navigator.pushReplacementNamed(context, 'gallery')),
                            _navText("CONTACT", () => Navigator.pushReplacementNamed(context, 'contact')),
                          ],
                        )

                      else
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        _roomCard(
                          imagePath: 'asset/threesheater.png',
                          roomType: 'Three Seater Room',
                          facilities: ['Food', 'WiFi', 'Cleaning'],
                          price: '₹6,500 / month',
                        ),
                        _roomCard(
                          imagePath: 'asset/twosheater.png',
                          roomType: 'Two Seater Room',
                          facilities: ['Food', 'WiFi', 'Cleaning'],
                          price: '₹7,000 / month',
                        ),
                        _roomCard(
                          imagePath: 'asset/personalroom.png',
                          roomType: 'Personal Room',
                          facilities: ['Food', 'WiFi', 'Cleaning'],
                          price: '₹10,000 / month',
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ),




            const SizedBox(height: 40),

          Aboutuscomp(),

         Footer(),

          ],
        ),
      ),
    );
  }

  Widget _navText(String title, VoidCallback onTap, {bool isActive = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.amber : Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }



  Widget _drawerNavItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer first
        onTap();                // Then execute actual navigation
      },
    );
  }

  Widget _roomCard({
    required String imagePath,
    required String roomType,
    required List<String> facilities,
    required String price,
  }) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomType,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...facilities.map((f) => Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
                      const SizedBox(width: 6),
                      Text(f),
                    ],
                  )),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}
