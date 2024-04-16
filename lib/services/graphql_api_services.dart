import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecom/helper/constents/ApiConst.dart';
import 'package:ecom/helper/global_components/product_list.dart';
import 'package:ecom/models/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart' as dio;
import 'package:lottie/lottie.dart';
import '../helper/common_methods.dart';
import '../helper/global_components/custom_lablel.dart';
import '../models/login_model.dart';
import '../models/product_list.dart';


class RestApiClient extends GetxService {
  final box = GetStorage();
  dio.Dio? _httpClient;


  RestApiClient() {
    _httpClient = dio.Dio();
    (_httpClient!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _httpClient!.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, handler) async {
        if (e.response?.realUri != null) {
          print('Endpoint: ${e.response?.realUri}');
        }
        // Check for internet connectivity first
        final isConnected = await isInternetConnected();
        if (!isConnected) {
          // If no internet connection, navigate to the no internet screen
          showNetworkDialog(Get.overlayContext!);
          final customError = DioError(
            requestOptions: e.requestOptions,
            error: "No internet connection",
            // type: DioErrorType.other,
          );
          // Print the endpoint URI if available

          return handler.reject(customError);
        }

        // Handle other errors here
        return handler.next(e);
      },
    ));
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  void showNetworkDialog(BuildContext buildContext) {
    showDialog<void>(
        context: buildContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Lottie.asset('assets/images/lottie/noInternet.json',
                      repeat: true, height: 70, width: 70),
                ),
                const CustomLabel(
                  text: "No Internet Connection!",
                  size: 18,
                  fontWeight: FontWeight.w500,
                ),
                const CustomLabel(
                  text: "Please Check Internet Connection",
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text("ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  Future<LoginModel?> loginUser(String email, String password) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'email': email,
        'password': password,
      });

      final response = await _httpClient?.post(
        '${ApiConst.baseUrl}${ApiConst.login}',
        data: formData,
      );

      if (response?.statusCode == 200) {
        LoginModel ? loginModel = LoginModel.fromJson(response?.data);
        return loginModel;
      } else {
        // Unsuccessful response
        print('Error - Status Code: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future<dynamic> registerUser(String name, String email, String mobile, String password) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
      });

      final response = await _httpClient?.post(
        '${ApiConst.baseUrl}${ApiConst.register}',
        data: formData,
      );

      if (response?.statusCode == 200) {
        dynamic data = jsonDecode(response!.data);
        if (data.containsKey('data')) {
          return RegisterModel.fromJson(data);
        } else {
          // Error response
          return ErrorResponse.fromJson(data);
        }
      } else if (response?.statusCode == 400) {
        // Handle status code 400 (Bad Request)
        dynamic data = jsonDecode(response!.data);
        if (data['title'] == 'User already exists.') {
          return ErrorResponse.fromJson(data);
        } else {
          print('Validation error: ${data['message']}');
          return null;
        }
      } else {
        print('Error - Status Code: ${response?.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
  Future<List<ProuductListModel>> fetchProductList() async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'user_login_token': 'c2a2f674c6f6a1d2374da1ebfab69adc',
      });

      final response = await _httpClient?.post(
        'https://shareittofriends.com/demo/flutter/productList.php',
        data: formData,
      );

      if (response?.statusCode == 200) {
        List<ProuductListModel> productList = (response?.data as List)
            .map((item) => ProuductListModel.fromJson(item))
            .toList();
        return productList;
      } else {
        throw Exception('Failed to fetch product list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


}
