import 'package:flutter/material.dart';
import 'package:new_chat/res/components/error_component.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/view/features/auth/login_view.dart';
import 'package:new_chat/view/features/auth/otp_view.dart';
import 'package:new_chat/view/features/auth/user_infomation_view.dart';

class Routes {
  static Route<dynamic> genericRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RoutesName.otpScreen:
        final verficationId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OTPView(verficationId: verficationId),
        );
        case RoutesName.userInformationScreen:
        return MaterialPageRoute(
          builder: (context) => const UserInformationView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: ErrorComponent(),
            );
          },
        );
    }
  }
}
