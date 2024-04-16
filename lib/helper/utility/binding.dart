import 'package:ecom/product_controller.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';


class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProductController());

  }
}
