import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Component/responsive.dart';
import 'package:http/http.dart' as http;

class Contactuspage extends StatefulWidget {
  const Contactuspage({super.key});

  @override
  State<Contactuspage> createState() => _ContactuspageState();
}

class _ContactuspageState extends State<Contactuspage> {
  final String mapUrl = 'https://maps.app.goo.gl/KHyG1gGxVpZeTycj6'; // Google Maps URL
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: isMobile
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Image.asset('asset/logo.png'),
            ),
            _drawerNavItem("HOME", () {
              Navigator.pushReplacementNamed(context, 'dashboard');
            }),
            _drawerNavItem("ABOUT", () {
              Navigator.pushReplacementNamed(context, 'about');
            }),
            _drawerNavItem("GALLERY", () {
              Navigator.pushReplacementNamed(context, 'gallery');
            }),
            _drawerNavItem("CONTACT", () {}),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with logo and nav
            Container(
              height: screenHeight ,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/banner.png'),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Navbar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('asset/logo.png', height: 40),
                      if (!isMobile)
                        Row(
                          children: [
                            _navText("HOME", () => Navigator.pushReplacementNamed(context, 'dashboard')),
                            _navText("ABOUT", () => Navigator.pushReplacementNamed(context, 'about')),
                            _navText("GALLERY", () => Navigator.pushReplacementNamed(context, 'gallery')),
                            _navText("CONTACT", () => Navigator.pushReplacementNamed(context, 'contact'), isActive: true),
                          ],
                        )
                      else
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.black),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Contact Form Container
                  Center(
                    child: Container(
                      width: isMobile ? double.infinity : 700,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Get in Touch", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: firstNameController,
                                  decoration: _inputDecoration("First name"),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: lastNameController,

                                  decoration: _inputDecoration("Last name"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          TextFormField(controller: emailController,decoration: _inputDecoration("Email")),
                          const SizedBox(height: 16),
                          TextFormField(controller: mobileController,decoration: _inputDecoration("Mobile No")),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: messageController,
                            maxLines: 5,
                            decoration: _inputDecoration("Message", hint: "Leave us a message..."),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                onPressed: () async {
                          final response = await http.post(
                          Uri.parse('https://formsubmit.co/riturajkota2@gmail.com'),
                          headers: {
                          'Content-Type': 'application/x-www-form-urlencoded',
                          },
                          body: {
                          'First Name': firstNameController.text,
                          'Last Name': lastNameController.text,
                          'Email': emailController.text,
                          'Mobile': mobileController.text,
                          'Message': messageController.text,
                          '_captcha': 'false', // optional: disable captcha
                          '_template': 'table', // optional: better formatting
                          },
                          );

                          if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Message Sent Successfully!"),
                          backgroundColor: Colors.green,
                          ));
                          // Clear the form
                          firstNameController.clear();
                          lastNameController.clear();
                          emailController.clear();
                          mobileController.clear();
                          messageController.clear();
                          } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Failed to send. Try again later."),
                          backgroundColor: Colors.red,
                          ));
                          }
                          },

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 4,
                              ),
                              icon: const Icon(Icons.send, color: Colors.white),
                              label: const Text("Send Message", style: TextStyle(fontSize: 16, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Contact Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Contact Us", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _infoCard(
                        icon: Icons.support_agent,
                        title: "Get In Touch",
                        content: "We'd love to hear from you! Questions, support, or just saying hi—reach out!",
                      ),
                      _infoCard(
                        icon: Icons.location_on,
                        title: "Our Address",
                        content: "Asklepios Tower\nMakima Street 251",
                      ),
                      _infoCard(
                        icon: Icons.call,
                        title: "Contact Info",
                        content: "+123 456 789\nhelp@nightingale.com",
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () async {
                      final Uri uri = Uri.parse(mapUrl);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'asset/static_map.png',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final Uri uri = Uri.parse(mapUrl);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
                      icon: const Icon(Icons.directions,color: Colors.black87,),
                      label: const Text("Get Directions",style: TextStyle(color: Colors.black87),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
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
            color: isActive ? Colors.amber : Colors.black,
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
      onTap: onTap,
    );
  }

  InputDecoration _inputDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue.shade700),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _infoCard({required IconData icon, required String title, required String content}) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.blue.shade700),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(content, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }



}
