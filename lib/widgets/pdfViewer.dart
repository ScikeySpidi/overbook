// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';
import 'package:overbook/model/model.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFviewer extends StatefulWidget {
  const PDFviewer({super.key, required this.paperX});
  //  const PDFviewer({Key? key,  required this.paperX}):super(key: key);
  final PostsModel paperX;

  @override
  State<PDFviewer> createState() => _PDFviewerState();
}

class _PDFviewerState extends State<PDFviewer> {
  DataController controller = Get.put(DataController());

  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String pdfPath = '';
  var pdfuri = Uri.parse(
      'https://drive.google.com/uc?export=view&id=1KVLZTOZxB-tuPw658mplynr5jt6IrFsc');

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.paperX .toString());
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print(
          "object-afffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
      controller.removeRecent();
      controller.setRecent(widget.paperX);
      // controller.getRecent();
    });

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.paperX.title.toString(),
              style: const TextStyle(color: Colors.black38),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                  semanticLabel: 'Bookmark',
                ),
                onPressed: () {
                  // debugPrint('_________<-->${controller.getData()}');
                  // controller.addToFavorite(widget.PaperX);
                  setState(() {
                    controller.setData(widget.paperX);
                    controller.getData();
                  });

//                        debugPrint( controller.getData().toString());
// controller.getData().then((valuee) =>  print(valuee));

                  // debugPrint('_________<-->${controller.box.values.toList().toString()}');
                },
              ),
            ],
          ),
          body: SfPdfViewer.network(widget.paperX.paperUrl.toString())

          // PdfViewer.uri(pdfuri,
          // enableTextSelection: true
          // ),

          ),
    );
  }
}
