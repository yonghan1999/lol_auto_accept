import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }


  static void showTitleProgressDialog(String title, {isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Text(title,style: const TextStyle(color: Colors.white,fontSize: 15, decoration: TextDecoration.none),)
            ],
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}
