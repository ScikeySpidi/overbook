// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
        // backgroundColor: Color.fromARGB(255, 82, 65, 65),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,

          title: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                // height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OverBook',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 25),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Ncet',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // centerTitle: true,
          toolbarHeight: 150,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Ncert TextBooks for Class 11',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        // const SizedBox(height: 15,),
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("maths"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Physice"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Chmistry"),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Bio"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                const Text(
                  'Ncert TextBooks for Class 12',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("maths"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Physice"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Chmistry"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(3),
                                height: 60,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/download (11).jpeg')),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const Text("Bio"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
