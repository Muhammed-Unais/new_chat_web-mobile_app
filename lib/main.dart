import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/res/components/error_component.dart';
import 'package:new_chat/res/components/loading.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/firebase_options.dart';
import 'package:new_chat/utils/responsive/responsive.dart';
import 'package:new_chat/utils/routes/routes.dart';
import 'package:new_chat/features/boarding/view/landing_view.dart';
import 'package:new_chat/features/mobile/mobile_layout.dart';
import 'package:new_chat/features/web/web_layout.dart';
import 'package:new_chat/features/auth/view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(background: backgroundColor),
        appBarTheme: const AppBarTheme(color: appBarColor),
      ),
      home: ref.watch(userDataAuthProvider).when(
        data: (UserModel? user) {
          if (user == null) {
            return const LandingView();
          }
          return const ResponsiveLayout(
            webLayout: WebLayout(),
            mobileLayout: MobileLayout(),
          );
        },
        error: (error, stackTrace) {
          return ErrorComponent(
            error: error.toString(),
          );
        },
        loading: () {
          return const Loading();
        },
      ),
      onGenerateRoute: Routes.genericRoute,
    );
  }
}
