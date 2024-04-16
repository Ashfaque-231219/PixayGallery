import 'package:ecom/helper/constents/color_const.dart';
import 'package:ecom/helper/constents/image_const.dart';
import 'package:ecom/helper/global_components/custom_lablel.dart';
import 'package:ecom/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth_controller.dart';
import 'loading_widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (co) {
      return co.isLoadings == true
          ? const Scaffold(
        body: Center(child: LoadingWidget()),
      )
          :      Scaffold(
        body: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,

                        child: IconButton(onPressed: (){
                          Get.back();
                        }, icon: Icon(Icons.arrow_back_ios))),

                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(ImageConst.iqImage,height:100,),
                    ),

                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomLabel(text: 'Vegetable',size: 22,fontWeight: FontWeight.bold,)),
                ),
                Padding(
                  padding: const EdgeInsets.all( 5),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorConst.bgColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                            color: Colors.grey.shade400)
                      ],
                    ),
                    width: double.infinity,
                    child: TextField(
                      decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Search',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.search)
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: co.productList?.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(co.productList![index].id.toString()), // Use a unique key for each item
                        direction: DismissDirection.horizontal, // Allow horizontal swiping
                        background: const Icon(Icons.delete, color: Colors.red),
                        secondaryBackground: const Icon(Icons.edit, color: Colors.blue),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            // Show delete confirmation dialog
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Item'),
                                content: const Text('Are you sure you want to delete this item?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Dismiss the dialog
                                      Navigator.pop(context);
                                      // Perform delete action
                                      setState(() {
                                        co.productList?.removeAt(index);
                                      });
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Dismiss the dialog
                                      Navigator.pop(context);
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              ),
                            );
                          } else if (direction == DismissDirection.endToStart) {
                            // Show edit action
                            // Implement your edit logic here
                          }
                        },
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isSelected = index;
                            var selected =  isSelected == index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Your existing content here
                                Container(
                                  width: 220,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(ImageConst.image3),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product Title
                                      Text(
                                        '${co.productList?[index].name}',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      // Product Price
                                      Text(
                                        '\$${co.productList?[index].price}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.favorite_border, size: 14),
                                              onPressed: () {
                                                // Handle favorite action
                                              },
                                            ),
                                          ),
                                          const SizedBox(width: 20,),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: ColorConst.darkGreen,
                                              border: Border.all(color: Colors.grey), // Add border to all sides
                                              borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 14),
                                              onPressed: () {
                                                // Handle add to cart action
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
            ]
        )          ),
        ),
      );

    });

  }
}