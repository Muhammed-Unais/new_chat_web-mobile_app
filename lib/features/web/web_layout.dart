import 'package:flutter/material.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/res/components/chat_list.dart';
import 'package:new_chat/res/components/contact_list.dart';
import 'package:new_chat/features/web/components/web_chat_appbar.dart';
import 'package:new_chat/features/web/components/web_message_input.dart';
import 'package:new_chat/features/web/components/web_profile_appbar.dart';
import 'package:new_chat/features/web/components/web_search_bar.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget> [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactsList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: dividerColor),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/backgroundImage.png",
                ),
              ),
            ),
            child: const Column(
              children:  [
                WebChatAppBar(),
                Expanded(
                  child: ChatList(),
                ),
                WebMessageInput(),
              ],
            ),
          )
        ],
      ),
    );
  }
}


