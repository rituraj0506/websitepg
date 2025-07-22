import 'package:flutter/material.dart';
import 'package:websiteschool/Component/responsive.dart';

class Aboutuscomp extends StatelessWidget {
  const Aboutuscomp({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Experience the Best PG Life at Affordable Rates",
                style: TextStyle(
                  fontSize: 24, // slightly smaller for mobile
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "The most affordable and comfortable PG accommodation not just in Laxmi Nagar, but across Delhi. "
                    "Enjoy a homely experience with freshly cooked meals — morning breakfast with tea, wholesome lunch, and delicious, healthy dinner. "
                    "Facilities include RO drinking water, a dedicated water cooler, and daily room cleaning. "
                    "Choose from spacious single, double, or triple sharing rooms. "
                    "High-speed Wi-Fi, 24×7 power backup with inverter, and a peaceful environment make it the perfect place to stay.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  "EXPLORE NOW",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'asset/banner2.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    )

        : Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Text Section
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Experience the Best PG Life at Affordable Rates",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "The most affordable and comfortable PG accommodation not just in Laxmi Nagar, but across Delhi. "
                      "Enjoy a homely experience with freshly cooked meals — morning breakfast with tea, wholesome lunch, and delicious, healthy dinner. "
                      "Facilities include RO drinking water, a dedicated water cooler, and daily room cleaning. "
                      "Choose from spacious single, double, or triple sharing rooms. "
                      "High-speed Wi-Fi, 24×7 power backup with inverter, and a peaceful environment make it the perfect place to stay.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    "EXPLORE NOW",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Right: Image Section
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'asset/banner2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
