import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show(String message,Color coo, {Duration duration = const Duration(seconds: 2)}) {
    Get.snackbar(
      '',
      '',
      messageText: _buildContent(message,coo),
      duration: duration,
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static Widget _buildContent(String message,coo) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: coo,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.info, color: Colors.white),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
