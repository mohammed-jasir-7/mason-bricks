import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:{{name}}/core/errors/global_error_handler.dart';
import 'package:{{name}}/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../clean_architecure/__brick__/lib/injectable.dart';
import '../api/api_request_queue.dart';


///get network info
abstract class NetworkInfo {
  ///if have internet connection it return true
  ///otherwise return false
  Future<bool>? get isConnected;
}
@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  bool _hasInitialized = false;

  NetworkInfoImpl(this.connectionChecker) {
    _listenToConnectivity();
  }

  void _listenToConnectivity() {
    connectionChecker.onConnectivityChanged.listen((List<ConnectivityResult> result) async {
      final isConnectedNow = result.any((r) => r != ConnectivityResult.none);

      if (_hasInitialized) {
        if (isConnectedNow) {
          if (navigatorState.currentContext != null) {
            GlobalErrorHandler().handleError(
              errorMessage: 'Connection Restored Successfully',
              color: Colors.green,
            );
          }
          await getIt<ApiQueue>().processQueue();
        } else {
          if (navigatorState.currentContext != null) {
            GlobalErrorHandler().handleError(
              errorMessage: 'No Internet Connection',
              color: Colors.red,
            );
          }
        }
      }

      // Mark initialization as done after the first event
      _hasInitialized = true;
    });
  }

  @override
  Future<bool> get isConnected async {
    var result = await connectionChecker.checkConnectivity();
    return result.firstOrNull != ConnectivityResult.none;
  }
}
