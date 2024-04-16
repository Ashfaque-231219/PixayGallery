import 'package:ecom/helper/global_components/custom_lablel.dart';
import 'package:ecom/helper/global_components/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/login_screen.dart';
import '../utility/binding.dart';


class Routers {
  static final route = [
    GetPage(
      name: '/loginScreen',
      page: () =>  const LoginScreen(),
      binding: RootBinding(),
    ),
    GetPage(
      name: '/productScreen',
      page: () =>  const ProductList(),
      binding: RootBinding(),
    ),

  ];
}



