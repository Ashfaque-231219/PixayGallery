import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class FireBaseMessagingService extends GetxService {
  // late CommunityMessagesController _cmc;
  // FireBaseMessagingService() {
  //   _cmc = CommunityMessagesController();
  // }

  Future<FireBaseMessagingService> init() async {
    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);
    String? token = await FirebaseMessaging.instance.getToken();
    print("Device Token is : $token");


    return this;
  }

}
