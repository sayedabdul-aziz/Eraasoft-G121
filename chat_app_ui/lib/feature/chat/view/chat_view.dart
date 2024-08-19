import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/chat/widgets/chat_list_widget.dart';
import 'package:chat_app_ui/feature/chat/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // favorite chats
          FavContactsWidget(),
          // chats
          ChatListWidget()
        ],
      ),
    );
  }
}
