import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';

class CustomIcon extends StatelessWidget {
  final iconData;
  final iconColor;

  const CustomIcon(this.iconData, {Key key, this.iconColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData ?? Icons.access_time,
      color: iconColor ?? Config.grayWhite,
    );
  }
}
