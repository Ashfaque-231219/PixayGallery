import 'dart:convert';

import 'package:ecom/helper/global_components/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../helper/global_components/full_image_view.dart';

class GalleryPage extends StatefulWidget {
  String? keyWord = "";
  GalleryPage({super.key, this.keyWord});
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  var imageResponse;

  int currentPage  = 1;
  int size= 10;
  int totalPages=1;
  final ScrollController _scrollController=ScrollController();

  List<dynamic> hits=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.keyWord);
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent)
        if(currentPage<totalPages!) {
          ++currentPage;
          getData(widget.keyWord);
        }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${widget.keyWord} Page $currentPage/$totalPages',
          style: const TextStyle(color:Colors.black),
        ),
        centerTitle: true,

      ),



      body: (imageResponse == null ? const Scaffold(body: Center(child: LoadingWidget())) : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: (imageResponse == null ? 0 : hits.length),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ // Check this line for extra comma
                GestureDetector(
                  onTap:(

                      ){
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => ImageScreen(imageUrl:  hits[index]['webformatURL'] ?? "")));
                  },
                  child: Expanded(
                    child: Image.network(
                      hits[index]['previewURL'] ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(Icons.favorite_border),
                      Text(" ${hits[index]['likes'] ?? ""} ".toString()),
                      const Icon(Icons.star_border),
                      Text(" ${hits[index]['favorites'] ?? ""} ".toString()),
                      const Icon(Icons.chat_bubble_outline),
                      Text(" ${hits[index]['comments'] ?? ""} ".toString()),
                    ],
                  ),
                ),
              ], // Check if there's an extra comma at the end of this list
            ),
          );
        },
      )),


    );
  }

  void getData(String? keyWord) {
    String url = "https://pixabay.com/api/?"
        "key=16582589-68a2e0e5d7a78080a8fa51cbe"
        "&q=${keyWord ?? ""}"
        "&page=$currentPage"
        "&per_page=$size";

    http.get(Uri.parse(url)).then((onResp) {
      setState(() {
        imageResponse = json.decode(onResp.body);
        hits.addAll(imageResponse['hits']);
        if (imageResponse['totalHits'] % size == 0) {
          totalPages = (imageResponse['totalHits']! ~/ size).toInt();
        } else {
          totalPages = (1 + (imageResponse['totalHits']! / size)).toInt();
        }
      });
    }).catchError((onError) {});
  }
}
