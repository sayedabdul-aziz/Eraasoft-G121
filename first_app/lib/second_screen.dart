import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Second Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                // border: Border.all(color: Colors.black, width: 2),
                // gradient: const LinearGradient(
                //     begin: Alignment.center,
                //     end: Alignment.topRight,
                //     stops: [
                //       .3,
                //       1.9
                //     ],
                //     colors: [
                //       Colors.blue,
                //       Colors.white,
                // ]),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white,
                //     spreadRadius: 1,
                //     blurRadius: 4,
                //     offset: Offset(0, 0),
                //   )
                // ],
                color: Colors.white,
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        'Ahmed Ali Ahmed Ali Ahmed Ahmed Ahmed Ali Ahmed Ali',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(width: 20),
                      Icon(Icons.share),
                      SizedBox(width: 20),
                      Icon(Icons.star)
                    ],
                  ),
                  Text(
                    ' Ahmed Ali Ahmed Ali Ahmed Ahmed Ahmed Ali Ahmed Ali',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
