import 'dart:async';

import 'package:social_media_app/app/Widget/connectivity_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityService {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
    if (connectionStatus == ConnectivityResult.none) {
      Get.put(ConnectivityController()).noInternet(true);
    } else {
      Get.put(ConnectivityController()).noInternet(false);
    }
    if (kDebugMode) {
      print("connectionStatus :::: $connectionStatus");
    }
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;

    if (ConnectivityService().connectionStatus == ConnectivityResult.none) {
      Get.put(ConnectivityController()).noInternet(true);
    } else {
      Get.put(ConnectivityController()).noInternet(false);
    }

    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Couldn\'t check connectivity status :::: $e');
      }
      return;
    }

    // if (!mounted) {
    //   return Future.value(null);
    // }

    return updateConnectionStatus(result);
  }
}
