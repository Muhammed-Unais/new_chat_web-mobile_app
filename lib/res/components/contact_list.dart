import 'package:flutter/material.dart';
import 'package:new_chat/color.dart';
import 'package:new_chat/info.dart';
import 'package:new_chat/view/mobile/mobile_chat_view.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(color: dividerColor, indent: 85);
        },
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MobileChatScreen(),
                ),
              );
            },
            title: Text(
              info[index]['name'].toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                info[index]['message'].toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                info[index]['profilePic'].toString(),
              ),
              radius: 30,
            ),
            trailing: Text(
              info[index]['time'].toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }
}
