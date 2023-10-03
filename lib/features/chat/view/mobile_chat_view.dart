import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/res/components/chat_list.dart';
import 'package:new_chat/features/chat/components/bottom_chat_list.dart';
import 'package:new_chat/features/auth/view_model/auth_view_model.dart';

class MobileChatScreen extends ConsumerWidget {
  const MobileChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  final String name;
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
          stream: ref.read(authViewModelProvider).userDataById(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(name);
            }
            if (snapshot.hasError) {
              return Text(name);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                snapshot.data!.isOnline
                    ? const Text(
                        "Online",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    : const SizedBox()
              ],
            );
          },
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatList(),
          ),
          BottomChatField(),
        ],
      ),
    );
  }
}
