import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/core/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    usersList[index].image ?? '',
                  ),
                ),
                title: Text(
                  usersList[index].name ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  usersList[index].lastMsg ?? '',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: Text(
                  usersList[index].time ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: usersList.length),
      ),
    );
  }
}
