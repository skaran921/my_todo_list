import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'CustomText.dart';

class CustomScaffold extends StatelessWidget {
  final String titleText;
  final Widget body;
  final Widget floatingActionButton;
  final bool hasAppBar;
  final List<Widget> actions;
  const CustomScaffold(
      {Key key,
      this.titleText,
      this.body,
      this.floatingActionButton,
      this.actions,
      this.hasAppBar = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: hasAppBar
          ? AppBar(
              title: CustomText(
                "${titleText ?? Config.appName}",
              ),
              actions: actions ?? [],
            )
          : null,
      body: body ?? Container(),
      floatingActionButton: floatingActionButton ?? Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
