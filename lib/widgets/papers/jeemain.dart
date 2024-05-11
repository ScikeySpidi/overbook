// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';
import 'package:overbook/widgets/papers.dart';

class JeeMain extends StatefulWidget {
  const JeeMain({super.key});

  @override
  State<JeeMain> createState() => _JeeMainState();
}

class _JeeMainState extends State<JeeMain> {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    List<int> JeeMains = <int>[
// 2016,
// 2017,
// 2018,
// 2019,
      2020,
      2021,
      2022,
      2023,
      2024,
    ];
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
                            'Wellcome To',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 25),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'OverBook',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
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
        body: Center(
          child: ListView.builder(
              itemCount: JeeMains.length,
              itemBuilder: (context, index) {
                int JeeMainYears = JeeMains[index];

                return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.filter(JeeMains[index], "jee main");
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Paper(JeeMainYears)));
                    },
                    child: Center(
                        child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              // side: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0)),
                          color: const Color.fromARGB(200, 15, 13, 13),

                          // elevation: 5.0,
                          child: Column(
                            children: [
                              Center(
                                child: ListTile(
                                  title: Text(
                                    JeeMains[index].toString(),
                                    style: const TextStyle(
                                        color: Colors.amberAccent),
                                  ),
                                  // subtitle: Text(data.description.toString().toUpperCase(),
                                  // style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    )));
              }),
        ));
  }
}
