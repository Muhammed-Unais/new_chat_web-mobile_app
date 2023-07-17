import 'package:flutter/material.dart';
import 'package:new_chat/res/components/contact_list.dart';
import 'package:new_chat/view/web/widgets/web_chat_appbar.dart';
import 'package:new_chat/view/web/widgets/web_profile_appbar.dart';
import 'package:new_chat/view/web/widgets/web_search_bar.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                WebProfileBar(),
                WebSearchBar(),
                ContactsList(),
              ],
            ),
          ),
        ),
        Column(
          children: [
           const WebChatAppBar(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/backgroundImage.png",
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
