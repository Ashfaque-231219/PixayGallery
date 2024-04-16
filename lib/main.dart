import 'package:ecom/helper/constents/image_const.dart';
import 'package:ecom/view/gallery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key ?key, this.title}) : super(key: key);
  final String? title;


  @override


  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String keyWord = "";
  TextEditingController editingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 2,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text(keyWord,
              style: const TextStyle(color: Colors.white),),
          ],
        ),
        centerTitle: true,

      ),


      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8,left: 5,right: 5),
            child: SizedBox(height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color:const Color(0xFFEFF1F4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, offset: Offset(0, 0))
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      keyWord = value;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => GalleryPage(keyWord: keyWord,)));

                  },

                  controller: editingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Search Flower, Any WallPaper',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),

                    prefixIcon: const Padding(
                      padding:  EdgeInsets.all(12),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          )



        ],
      ),

    );

















  }
}