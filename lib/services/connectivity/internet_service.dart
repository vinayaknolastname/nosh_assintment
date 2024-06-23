import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityUtil {
  isInternetAvailable(BuildContext context) async {
    try {
      final response = await http
          .head(Uri.parse('https://www.google.com'))
          .timeout(Duration(seconds: 5));
    } catch (_) {
      showDialog(
          context: (context),
          builder: (_) => AlertDialog(
                title: Text("No internet connection"),
              ));
    }
  }

  static StreamSubscription<ConnectivityResult>? connectivitySubscription;

  // static void startMonitoring(BuildContext context, Function(bool) onChanged) {
  //   connectivitySubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     checkConnectivity(result, onChanged);
  //   });

  //   checkConnectivity(ConnectivityResult.none, onChanged); // Initial check
  // }

  // static void checkConnectivity(
  //     ConnectivityResult result, Function(bool) onChanged) {
  //   if (result == ConnectivityResult.none) {
  //     onChanged(false);
  //   } else {
  //     isInternetAvailable().then((internetAvailable) {
  //       onChanged(internetAvailable);
  //     });
  //   }
  // }

  static void stopMonitoring() {
    connectivitySubscription?.cancel();
  }
}
