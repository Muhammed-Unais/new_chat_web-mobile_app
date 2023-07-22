import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/firebase_options.dart';
import 'package:new_chat/utils/routes/routes.dart';
import 'package:new_chat/view/features/boarding/landing_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
        appBarTheme: const AppBarTheme(color: appBarColor),
      ),
      home: const LandingView(),
      onGenerateRoute: Routes.genericRoute,
    );
  }
}
