import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'CustomText.dart';

class CustomScaffold extends StatelessWidget {
  final String titleText;
  final Widget body;
  final Widget floatingActionButton;
  const CustomScaffold(
      {Key key, this.titleText, this.body, this.floatingActionButton})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: CustomText(
        "${titleText ?? Config.appName}",
      )),
      body: body ?? Container(),
      floatingActionButton: floatingActionButton ?? Container(),
    ));
  }
}
