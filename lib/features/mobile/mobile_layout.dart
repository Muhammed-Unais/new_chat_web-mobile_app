import 'package:flutter/material.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/res/components/contact_list.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/features/mobile/components/appbar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.selectConatactsScreen);
          },
          backgroundColor: tabColor,
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
