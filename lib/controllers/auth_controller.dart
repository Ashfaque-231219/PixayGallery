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

class AuthController extends GetxController {
  var isLoadings = false;
  LoginModel? loginModel;
  RegisterModel? registerModel;
  List<ProuductListModel>? productList;

  late RestApiClient _restApiClient;

  final box = GetStorage();



  AuthController() {
    _restApiClient = RestApiClient();
  }

  @override
  void onInit() async {
    super.onInit();
    if (box.read("userToken") != null) {
      getProduct();

    }
  }

  Future<LoginModel?> loginUser(String email, String password) async {
    try {
      isLoadings = true;
      update();
      loginModel = await _restApiClient.loginUser(email, password);

      if (loginModel != null && loginModel?.data?.email == email) {
        print("the userTokens is ====>> ${loginModel?.data?.userToken}");
        box.write('userToken', loginModel?.data?.userToken);
        CommonMethods.successMessage('Login SuccessFully');
        Get.toNamed('productScreen');
        isLoadings = false;
        update();
        return loginModel;
      } else {
        CommonMethods.errorMessage('Please enter the Valid Credentials');
        isLoadings = false;
        update();
      }
    } catch (e) {
      isLoadings = false;
      update();
      print('Error: $e');
    }
  }
  Future<RegisterModel?> registerUser(String name,String email, String  num, String password) async {
    try {
      isLoadings = true;
      update();
      registerModel = await _restApiClient.registerUser(name, email, num, password);
      if (registerModel != null &&registerModel?.message== 'Your account is created.' ) {
        CommonMethods.successMessage('Accounts created');
        Get.to(LoginScreen());


        isLoadings = false;
        update();
        return registerModel;
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



