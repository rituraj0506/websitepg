import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  final String mapUrl = 'https://maps.app.goo.gl/KHyG1gGxVpZeTycj6';

  void _launchMap() async {
    final Uri url = Uri.parse(mapUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Our Address',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),

          // ✅ Clickable Address with Location Icon
          InkWell(
            onTap: _launchMap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'FF-36, Laxmi Nagar, near Tikona Park & Mother Dairy, Delhi - 110092.\nNear Nirman Vihar Metro Station.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(FontAwesomeIcons.facebook, size: 20, color: Colors.blue),
              SizedBox(width: 16),
              Icon(FontAwesomeIcons.twitter, size: 20, color: Colors.black),
              SizedBox(width: 16),
              Icon(FontAwesomeIcons.instagram, size: 20, color: Colors.red),
              SizedBox(width: 16),
              Icon(FontAwesomeIcons.linkedinIn, size: 20, color: Colors.blue),
            ],
          ),

          const SizedBox(height: 24),

          // Footer Text
          const Text(
            'made with ❤️ by Azad House Pg',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),

        ],
      ),
    );
  }
}
