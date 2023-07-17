import 'package:flutter/material.dart';
import 'package:new_chat/color.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appBarColor,
      centerTitle: false,
      title: const Text(
        'NewChat',
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.grey),
          onPressed: () {},
        ),
      ],
      bottom: const TabBar(
        indicatorColor: tabColor,
        indicatorWeight: 4,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: tabColor,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(  
            text: 'CHATS',
          ),
          Tab(
            text: 'STATUS',
          ),
          Tab(
            text: 'CALLS',
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(104);
}