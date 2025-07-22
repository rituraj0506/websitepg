import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;


  const Responsive({super.key,required this.mobile,this.tablet,this.desktop});

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width<=600;
  static bool isTablet(BuildContext context) => MediaQuery.sizeOf(context).width<840 && MediaQuery.sizeOf(context).width>600;
  static bool isDeskTop(BuildContext context) => MediaQuery.sizeOf(context).width>=840;



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if(size.width>=840){
      return desktop!;
    }
    else if(size.width>600 && tablet!=null)
    {
      return tablet!;
    }
    else{
      return mobile;
    }
  }
}