import 'package:flutter/material.dart';
import 'package:websiteschool/Component/footer.dart';
import 'package:websiteschool/Component/pg_branch.dart';
import 'package:websiteschool/Component/pg_services.dart';


import '../Component/responsive.dart';


class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = Responsive.isMobile(context);


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
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: screenHeight,
                  color: Colors.black.withOpacity(0.5),
                ),
                Container(
                  height: screenHeight,
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
                                  _navText("HOME", () => Navigator.pushReplacementNamed(context, 'dashboard'),isActive: true),
                                  _navText("ABOUT", () => Navigator.pushReplacementNamed(context, 'about')),
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

                      const Spacer(),

                      // Hero Content
                      Center(
                        child: Column(
                          children: const [
                            Text(
                              "Azad House PG LaxmiNagar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Most affordable PG accommodation for students in Laxmi Nagar.\nIncludes delicious food, high-speed Wi-Fi, RO drinking water,\nelectricity bill, and laundry services — all under one roof.",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Center(
              child: Text(
                "Our Facilites",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            PgServices(),

            const SizedBox(height: 40),

            Center(
              child: Text(
                "Our different Branches",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const PgBranch(),

            const SizedBox(height: 40),
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

}



