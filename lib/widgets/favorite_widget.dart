import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';
import 'package:overbook/widgets/pdfViewer.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    DataController controller = Get.put(DataController());

    //    Future<void> removeFav(String articleId) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   controller.filteredPaper = prefs.getStringList('user')!.cast<PostsModel>();
    //   if (controller.filteredPaper != null) {
    //     await prefs.remove('${controller.filteredPaper.where((id) => articleId == id)}'); //I'm guessing id here returns an element of this list..??
    //     print('unfavorited');
    //     setState(() {
    //       controller.filteredPaper = false as List<PostsModel>;
    //       controller.setData(controller.filteredPaper);
    //     });
    //   } else {
    //     print('favoriteList was null');
    //   }
    // }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      floatingActionButton: controller.favoritePaper.isEmpty
          ? null
          : FloatingActionButton.small(
              child:
                  const Icon(Icons.delete, size: 25, color: Colors.redAccent),
              onPressed: () {
                setState(() {
                  controller.remove();
                });
              }),
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
                          style: TextStyle(color: Colors.black87, fontSize: 25),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Bookmarks',
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
      body: Container(
        child: controller.favoritePaper.isEmpty
            ? const Center(
                child: Text("Not Bookmarks",
                    style: TextStyle(color: Colors.black54, fontSize: 20)))
            : Center(
                child: ListView.builder(
                  itemCount: controller.favoritePaper.length,
                  itemBuilder: (context, index) {
                    var data = controller.favoritePaper[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFviewer(
                                        paperX: data,
                                      )));
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
                                      data.title.toString(),
                                      style: const TextStyle(
                                          color: Colors.amberAccent),
                                    ),
                                    subtitle: Text(
                                      data.description.toString().toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    // trailing: Column(
                                    // children: [
                                    // IconButton(
                                    //   icon: const Icon(Icons.favorite,
                                    //       color: Colors.pinkAccent),
                                    //   onPressed: () {

                                    //      setState(() {

                                    //         // controller.favoritePaper().remove(index);
                                    //         // removeFav(controller.favoritePaper()[index].id);

                                    //       });

                                    //   },
                                    // )
                                    // ],
                                    // ),
                                  ),

                                  // SizedBox(
                                  //   height: 200.0,
                                  //   child: Ink.image(
                                  //     image: NetworkImage(data.date.date),
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),

                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 16.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${data.date.years.bitLength == 0 ? " _" : data.date.years.toString()}${data.date.month.isEmpty ? " _" : data.date.month.toString()}${data.date.date.bitLength == 0 ? " _" : data.date.date.toString()}',
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
