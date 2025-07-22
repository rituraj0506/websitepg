import 'package:flutter/material.dart';
import 'package:websiteschool/Pages/DashboardPage.dart';
import '../Component/responsive.dart';
import '../model/gallery.dart';
import 'AboutusPage.dart';

class Gallerypage extends StatefulWidget {
  const Gallerypage({super.key});

  @override
  State<Gallerypage> createState() => _GallerypageState();
}

class _GallerypageState extends State<Gallerypage> {

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

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height * 0.35;

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

      body: Column(
        children: [
          // Custom Top Header with Logo + Nav or Drawer
          Stack(
            children: [
              Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/background.jpg'),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('asset/logo.png', height: 40),
                    if (!isMobile)
                      Row(
                        children: [
                          _navText("HOME", () => Navigator.pushReplacementNamed(context, 'dashboard')),
                          _navText("ABOUT", () => Navigator.pushReplacementNamed(context, 'about'),),
                          _navText("GALLERY", () => Navigator.pushReplacementNamed(context, 'gallery'),isActive: true),
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
              ),
            ],
          ),

          // Gallery Section
          Expanded(
            child: Responsive(
              mobile: _buildGrid(context, crossAxisCount: 2),
              tablet: _buildGrid(context, crossAxisCount: 3),
              desktop: _buildGrid(context, crossAxisCount: 4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, {required int crossAxisCount}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: galleryImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final image = galleryImages[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  image.imagePath,
                  fit: BoxFit.cover,
                ),
                if (image.caption.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: Text(
                        image.caption,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
