// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:overbook/controller/collector.dart';
import 'package:overbook/model/model.dart';
import 'package:overbook/widgets/exploreWidget.dart';
import 'package:overbook/widgets/favorite_widget.dart';
import 'package:overbook/widgets/papers/cuet.dart';
import 'package:overbook/widgets/papers/jee.dart';
import 'package:overbook/widgets/papers/jeemain.dart';
import 'package:overbook/widgets/pdfViewer.dart';

class ContentsHome extends StatefulWidget {
  const ContentsHome({super.key});

  @override
  State<ContentsHome> createState() => _ContentsHomeState();
}

class _ContentsHomeState extends State<ContentsHome>
    with TickerProviderStateMixin {
  DataController controller = Get.put(DataController());

  Future<void> getPostApi() async {
    String meApi =
        'https://ap-south-1.aws.data.mongodb-api.com/app/application-0-ppgug/endpoint/paper';

    try {
      final response = await http.get(Uri.parse(meApi));
      var data = json.decode(response.body);
      // debugPrint('Data is $data');
      setState(() {
        //  debugPrint("adding${controller.box as PostsModel}");
        // ignore: unrelated_type_equality_checks
        // controller.favoritedatalist.add(controlle`r.box.values as List); .

        controller.dataList =
            data.map<PostsModel>((e) => PostsModel.fromJson(e)).toList();
        //  setState(() {controller.boxP.get(controller.dataList == controller.favoritedatalist);});

        //  controller.favoritedatalist as Box<PostsModel> == controller.box;
      });
      // ignore: unnecessary_brace_in_string_interps
      // debugPrint('data is ${controller.dataList}');
      // debugPrint('data is... ${controller.box.values}');
    } catch (e, s) {
      // debugPrint('Exception is $e');
      debugPrint('--------------------------> ${controller.dataList}');
      debugPrintStack(stackTrace: s);
    }
  }

  @override
  void initState() {
    super.initState();
    getPostApi();
  }

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    setState(() {
      print("recent data colecting.....");
      controller.getRecent();
    });
    return Scaffold(
      // bottomNavigationBar:BottomNav(),

      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      floatingActionButton: controller.recentPaper.isEmpty
          ? null
          : FloatingActionButton.small(
              child:
                  const Icon(Icons.forward, size: 30, color: Colors.redAccent),
              onPressed: () {
                setState(() {
                  controller.getRecent();
                  //  debugPrint("favoritePaper >>>   ${controller.favoritePaper}");
                  //  debugPrint("favoritePaper >>>   ${controller.getData()}");
                  //  debugPrint("adding   ${controller.recentPaper[0]}");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PDFviewer(paperX: controller.recentPaper[0])));
                });
              }),
      // appBar: AppBar(

      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.black87,
      //     ),
      //     onPressed: () {},
      //   ), systemOverlayStyle: SystemUiOverlayStyle.dark,

      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.black87,
      //     ),
      //     onPressed: () {},
      //   ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      // ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/download (11).jpeg")),
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    'Wellcome To',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  const Text(
                    'OverBook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  //                 Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     // Padding(padding: EdgeInsets.only(top: 400)),
                  //     Text('${controller.currentType}'),
                  //     PopupMenuButton<String>(
                  //       icon: const Icon(Icons.arrow_downward),
                  //       onSelected: choiceAction,
                  //       itemBuilder: (BuildContext context) {
                  //         return Constants.choices.map((String choice) {
                  //           return PopupMenuItem<String>(
                  //             value: choice,
                  //             child: Text(choice),
                  //           );
                  //         }).toList();
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(3),
                  //   decoration: BoxDecoration(
                  //       color: const Color.fromRGBO(244, 243, 243, 1),
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: const TextField(
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         prefixIcon: Icon(
                  //           Icons.search,
                  //           color: Colors.black87,
                  //         ),
                  //         hintText: "Search you're looking for",
                  //         hintStyle:
                  //             TextStyle(color: Colors.grey, fontSize: 15)),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //        controller.recentPaper.isNotEmpty? const Text(
                  //           'Recently Looked',
                  //           style:
                  //               TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  //         ):SizedBox(height: 0,),
                  //        controller.recentPaper.isNotEmpty? Container(
                  //           height: 150,
                  //           child:
                  // Center(
                  //     child: ListView.builder(
                  //         itemCount: 1,
                  //         itemBuilder: (context, index) {
                  //           var data = controller.recentPaper[index];
                  //           return GestureDetector(
                  //             onTap: () {
                  //    Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFviewer(data)));
                  //     },
                  //           child: Center(
                  //             child: Container(
                  //               margin:const EdgeInsets.all(10),

                  //             child: Card(
                  //                 shape:  RoundedRectangleBorder(
                  //                   // side: const BorderSide(color: Colors.deepPurpleAccent),
                  //                   borderRadius: BorderRadius.circular(15.0)
                  //                 ),
                  //                 color: const Color.fromARGB(255, 15, 13, 13),

                  //                   elevation: 5.0,
                  //                   child: Column(

                  //                     children: [

                  //                       ListTile(
                  //                         title: Text(data.title.toString(),
                  //                         style: const TextStyle(color: Colors.amberAccent),),
                  //                         subtitle: Text(data.description.toString().toUpperCase(),
                  //                             style: const TextStyle(color: Colors.white),
                  //                         ),

                  //                       ),

                  //                     // Container(
                  //                     //         padding: const EdgeInsets.only(left: 16.0,bottom: 16.0),
                  //                     //         alignment: Alignment.centerLeft,
                  //                     //         child: Text('${data.date.years.bitLength==0?" _":data.date.years.toString()}${data.date.month.isEmpty?" _":data.date.month.toString()}${data.date.date.bitLength==0?" _":data.date.date.toString()}',style: const TextStyle(color: Colors.white,fontSize: 10),)
                  //                     //         ,
                  //                     //       ),

                  //                     ],

                  //                   )

                  //                 ),
                  //                 )

                  //                ));

                  //         },
                  //       ),
                  //   ),
                  //         ):const SizedBox(
                  //           height: 0,
                  //         ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Favorite()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      height: 75,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/download (11).jpeg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text(
                                  'Favorites',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.bookmark_added,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    'Papers',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 111,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Jee()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/download (12).jpeg')),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    stops: const [
                                      0.3,
                                      0.9
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(.8),
                                      Colors.black.withOpacity(.2)
                                    ]),
                              ),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'JEE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (const JeeMain())));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/download (18).jpeg')),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    stops: const [
                                      0.3,
                                      0.9
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(.8),
                                      Colors.black.withOpacity(.2)
                                    ]),
                              ),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'JEE MAIN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Cuet()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/download (20).jpeg')),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    stops: const [
                                      0.3,
                                      0.9
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(.8),
                                      Colors.black.withOpacity(.2)
                                    ]),
                              ),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'CUET',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // promoCard('assets/images/Aurora-music-38618732-1920-1280.jpg'),
                        // promoCard('assets/images/Aurora-music-38618732-1920-1280.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    'More',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExploreWidget()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      height: 75,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/download (6).jpeg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text(
                                  'Ncert Books',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.explore,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
