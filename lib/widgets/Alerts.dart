import 'package:flutter/material.dart';

class Alerts {
  static successAlert(BuildContext context) {
    return showDialog(context: context, child: AlertDialog());
  }
}
