import 'package:flutter/material.dart';
import 'package:new_chat/features/auth/view/login_view.dart';
import 'package:new_chat/features/auth/view/otp_view.dart';
import 'package:new_chat/features/auth/view/user_infomation_view.dart';
import 'package:new_chat/res/components/error_component.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/features/select_conatact/view/select_contacts_view.dart';
import 'package:new_chat/features/chat/view/mobile_chat_view.dart';

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
      case RoutesName.selectConatactsScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectContactsView(),
        );
      case RoutesName.mobileChatScreen:
        final userData = settings.arguments as Map<String, dynamic>;
        final name = userData['name'];
        final uid = userData['uid'];
        return MaterialPageRoute(
          builder: (context) => MobileChatScreen(
            name: name,
            uid: uid,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: ErrorComponent(error: "Unknown Error"),
            );
          },
        );
    }
  }
}
