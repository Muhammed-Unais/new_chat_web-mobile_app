import 'package:flutter/material.dart';
import 'package:new_chat/color.dart';
import 'package:new_chat/utils/responsive.dart';
import 'package:new_chat/view/web/desktop_layout.dart';
import 'package:new_chat/view/mobile/mobile_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(background: backgroundColor),
      ),
      home: const ResponsiveLayout(
        desktopLayout: DesktopLayout(),
        mobileLayout: MobileLayout(),
      ),
    );
  }
}
