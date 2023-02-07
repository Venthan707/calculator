//import 'package:calculater/calculater.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'Calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context,widget)=> ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            maxWidth: 1700,
            minWidth: 350,
            defaultScale: true,
            breakpoints: const [ResponsiveBreakpoint.autoScale(350,name: MOBILE),
              ResponsiveBreakpoint.autoScale(1000,name: TABLET),
              ResponsiveBreakpoint.autoScale(1200,name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: 'XL')
            ]
        ),
      debugShowCheckedModeBanner: false,
      home:  CalculatorApp()
    );
  }
}




