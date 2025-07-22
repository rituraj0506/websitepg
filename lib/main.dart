import 'package:flutter/material.dart';
import 'package:websiteschool/Pages/ContactusPage.dart';
import 'package:websiteschool/Pages/DashboardPage.dart';
import 'package:websiteschool/Pages/AboutusPage.dart';
import 'package:websiteschool/Pages/GalleryPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'dashboard',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'dashboard':
            builder = (context) => const Dashboardpage();
            break;
          case 'about':
            builder = (context) => const Aboutuspage();
            break;
          case 'gallery':
            builder = (context) => const Gallerypage();
            break;
          case 'contact':
            builder = (context) => const Contactuspage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return PageRouteBuilder(
          pageBuilder:
              (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: Duration.zero, // No transition time
          reverseTransitionDuration:
          Duration.zero, // No reverse transition time
        );
      },
    ),
  );
}