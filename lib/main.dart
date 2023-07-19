import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_chat/color.dart';
import 'package:new_chat/firebase_options.dart';
import 'package:new_chat/utils/responsive.dart';
import 'package:new_chat/view/features/landing_view.dart';
import 'package:new_chat/view/web/web_layout.dart';
import 'package:new_chat/view/mobile/mobile_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home:const LandingView()
      // const ResponsiveLayout(
      //   webLayout: WebLayout(),
      //   mobileLayout: MobileLayout(),
      // ),
    );
  }
}
