import 'package:flutter/material.dart';
import 'package:galaxy/detail.dart';

import 'global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'detail': (context) => const Detail()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Galaxy Planets"),
          backgroundColor: const Color(0xff24243e).withOpacity(0.8),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: const Color(0xff24243e),
          child: ListView(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              children: Global.planet
                  .map((e) => Stack(alignment: Alignment.centerLeft, children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('detail', arguments: e);
                          },
                          child: Card(
                            margin: const EdgeInsets.only(left: 60, top: 15),
                            elevation: 3,
                            color: const Color(0xff302b63),
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.all(10),
                              height: 180,
                              width: 350,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.more_vert_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    e['name'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      e['galaxy'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 90, bottom: 20),
                                      height: 3,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.network(
                                        'https://cdn.iconscout.com/icon/premium/png-256-thumb/radius-1741026-1482226.png?f=webp&w=256',
                                        color: Colors.grey,
                                        height: 20,
                                      ),
                                      Text(
                                        "${e['radius']} km",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Image.network(
                                        'https://icon-library.com/images/gravity-icon/gravity-icon-2.jpg',
                                        height: 20,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "${e['gravity']} m/s²",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        RotationTransition(
                          turns: animationController,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                              e['image'],
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      ]))
                  .toList()),
        ),
      ),
    );
  }
}
