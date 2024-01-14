
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nexticon_task/Utils/api_stauts.dart';
import 'package:nexticon_task/Widgets/custom_snackbar.dart';


class ExceptionService {
  static Future<Object> applyTryCatch(Function callback,
      {String? message}) async {
    try {
      Object result = await callback();
      return result;
    }on SocketException catch(e){
      CustomSnackbar.show(e.message, Colors.red);
      return Failure(e.port, e.message);
    }on TimeoutException catch (e){
      CustomSnackbar.show(e.message??"Time out", Colors.red);
      return Failure(e.duration, e.message??"");
    } catch (e) {
      if (message != null) {
        return Failure(400, message);
      }
      return Failure(400, e.toString());
    }
  }
}
