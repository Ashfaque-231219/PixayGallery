import 'package:dio/dio.dart';
import 'package:ecom/helper/common_methods.dart';
import 'package:ecom/helper/global_components/product_list.dart';
import 'package:ecom/models/login_model.dart';
import 'package:ecom/models/register_model.dart';
import 'package:ecom/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../models/product_list.dart';
import '../services/graphql_api_services.dart';

class ProductController extends GetxController {
  var isLoadings = false;

  List<ProuductListModel>? productList;

  late RestApiClient _restApiClient;

  final box = GetStorage();



  ProductController() {
    _restApiClient = RestApiClient();
  }

  @override
  void onInit() async {
    super.onInit();
    if (box.read("userToken") != null) {
      getProduct();

    }
  }

  Future<List<  ProuductListModel>?> getProduct() async {
    try {
      isLoadings = true;
      update();
      productList  = await _restApiClient.fetchProductList();
      if (productList != null) {
        isLoadings = false;
        update();
        return productList;
      } else {
        isLoadings = false;
        update();
      }
    } catch (e) {
      isLoadings = false;
      update();
      print('Error: $e');
    }
  }

}



