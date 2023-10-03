import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/res/components/costum_button.dart';
import 'package:new_chat/utils/routes/routes_name.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome To New Chat",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            SvgPicture.asset(
              'assets/images/undraw_begin_chat_re_v0lw.svg',
              height: 340,
              width: 340,
              theme: const SvgTheme(currentColor: tabColor),
            ),
            SizedBox(
              height: size.height / 9,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Read our Privacy and Policy. Tap 'Agree and continue' to accept the Terms of service",
                style: TextStyle(color: colorGrey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: "AGREE AND CONTINUE",
                onPressed:() => navigateToLogin(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
