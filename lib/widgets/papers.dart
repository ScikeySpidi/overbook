// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';
import 'package:overbook/model/model.dart';
import 'package:overbook/widgets/pdfViewer.dart';

class Paper extends StatefulWidget {
  final int JEEMainYyears;
  // final  List<PostsModel>  filteredPaper;
  const Paper(this.JEEMainYyears, {super.key
      //  required this.filteredPaper
      });

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
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
                children: [
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'OverBook',
                          style: TextStyle(color: Colors.black87, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Year ${widget.JEEMainYyears.toString()}',
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // centerTitle: true,
        toolbarHeight: 150,
      ),
      body: Container(
        child: controller.filteredPaper.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView.builder(
                  itemCount: controller.filteredPaper.length,
                  itemBuilder: (context, index) {
                    PostsModel PaperX = controller.filteredPaper[index];
                    // controller.favoritePaperx.add(controller.filteredPaper[0]);
                    return GestureDetector(
                        onTap: () {
                          // controller.getData().clear();

                          // debugPrint('--------------->${controller.recentPaper.toString()}');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFviewer(
                                      paperX:
                                          controller.filteredPaper[index])));
                        },
                        child: Center(
                            child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  // side: const BorderSide(color: Colors.deepPurpleAccent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              color: const Color.fromARGB(255, 15, 13, 13),
                              elevation: 5.0,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      PaperX.title.toString(),
                                      style: const TextStyle(
                                          color: Colors.amberAccent),
                                    ),
                                    subtitle: Text(
                                      PaperX.description
                                          .toString()
                                          .toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 16.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${PaperX.date.years.bitLength == 0 ? "  _" : PaperX.date.years.toString()}${PaperX.date.month.isEmpty ? "  _" : PaperX.date.month.toString()}${PaperX.date.date.bitLength == 0 ? "  _" : PaperX.date.date.toString()}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              )),
                        )));
                  },
                ),
              ),
      ),
    );
  }
}
