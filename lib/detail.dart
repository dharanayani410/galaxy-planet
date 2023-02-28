import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  late AnimationController rotation;
  @override
  void initState() {
    super.initState();

    rotation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5u_QsR2LrWebI9slE5JeqQpEz0HPKBzIyr2kyMDkngXUy0I0wkfqLnwdXC_vj5ZR21XU&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
              flex: 1,
              child: Stack(alignment: const Alignment(0, -2.5), children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xff302b63),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "OverView",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  height: 3,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                Text(
                                  data['detail'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                                color: Color(0xff000C40),
                              ),
                              child: const Icon(
                                Icons.keyboard_double_arrow_up,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 400,
                                      color: const Color(0xff000C40)
                                          .withOpacity(0.8),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: 80,
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(20)),
                                              color: Color(0xff000C40),
                                            ),
                                            child: Text(
                                              "Welcome to ${data['name']}",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                                AssetImage(data['image']),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Distance To Sun",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${data['sun']}  miles",
                                            style: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Distance To Earth",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${data['distance']}  km",
                                            style: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Stack(alignment: const Alignment(0, -2.5), children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 230,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff000C40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            data['name'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              data['galaxy'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 3,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://cdn.iconscout.com/icon/premium/png-256-thumb/radius-1741026-1482226.png?f=webp&w=256',
                                color: Colors.grey,
                                height: 20,
                              ),
                              Text(
                                "${data['radius']} km",
                                style: const TextStyle(color: Colors.grey),
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
                                "${data['gravity']} m/s²",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: rotation,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        data['image'],
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ]),
              ]))
        ],
      )),
    );
  }
}
