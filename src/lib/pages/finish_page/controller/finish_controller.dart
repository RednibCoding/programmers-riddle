import 'package:flutter/material.dart';

import '../finish_page.dart';

class FinishController {
  static void onBtnBackClick() {
    Navigator.popUntil(finishPageKey.currentContext!, (route) => route.isFirst);
  }
}
