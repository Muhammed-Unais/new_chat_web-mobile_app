
import 'package:flutter/material.dart';
import 'package:new_chat/res/style/color.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({
    super.key,
  });

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  bool isShowSendButton = false;

  void changingIcons(bool value) {
    isShowSendButton = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  Icons.emoji_emotions,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              hintText: 'Type a message...',
              hintStyle: const TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                changingIcons(true);
              } else {
                changingIcons(false);
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
          child: CircleAvatar(
            radius: 23,
            backgroundColor: const Color(0xFF128C7E),
            child: Icon(isShowSendButton ? Icons.send : Icons.mic),
          ),
        )
      ],
    );
  }
}
