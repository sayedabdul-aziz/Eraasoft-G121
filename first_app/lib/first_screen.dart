import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.menu,
            color: Colors.deepOrange,
            size: 25,
          ),
          centerTitle: true,
          title: const Text(
            'My First App',
            style: TextStyle(color: Colors.deepOrange, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ClipOval(
              //   child: Image.network(
              //     'https://e0.365dm.com/21/10/768x432/skysports-mohamed-mo-salah_5555663.jpg?20211022175542',
              //     width: 300,
              //     height: 300,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // const CircleAvatar(
              //   radius: 150,
              //   backgroundImage: NetworkImage(
              //       'https://e0.365dm.com/21/10/768x432/skysports-mohamed-mo-salah_5555663.jpg?20211022175542'),
              // ),
              ClipOval(
                child: Image.asset(
                  'assets/mosalah.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              // const CircleAvatar(
              //   radius: 150,
              //   backgroundImage: AssetImage('assets/mosalah.jpg'),
              // ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Sayed Abdul-Aziz',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook_rounded,
                        color: Colors.blueGrey,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.redAccent,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.snapchat_rounded,
                        color: Colors.yellow,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.telegram_rounded,
                        color: Colors.blue,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
