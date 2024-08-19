import 'package:chat_app_ui/core/models/user_model.dart';
import 'package:flutter/material.dart';

class FavContactsWidget extends StatelessWidget {
  const FavContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorite Contacts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // fav list
          SizedBox(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          usersList[index].image ?? '',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(usersList[index].name?.split(' ').first ?? '',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: usersList.length),
          ),
        ],
      ),
    );
  }
}
