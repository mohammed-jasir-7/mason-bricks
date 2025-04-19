import 'package:{{name}}/main.dart';
import 'package:flutter/material.dart';

class GlobalErrorHandler {
  static final GlobalErrorHandler _instance = GlobalErrorHandler._internal();
  bool _isSnackbarVisible = false;

  factory GlobalErrorHandler() {
    return _instance;
  }

  GlobalErrorHandler._internal();

  void handleError( {required String errorMessage,Color? color}) {
    if (!_isSnackbarVisible) {
      _isSnackbarVisible = true;
    if(navigatorState.currentState!=null)
     ScaffoldMessenger.of(navigatorState.currentState!.context).showSnackBar(SnackBar(
                backgroundColor:color?? Colors.red,
                
                content: Text(errorMessage.toString()),
              )).closed.then((_) {
        _isSnackbarVisible = false;
      });
    }
  }
}
