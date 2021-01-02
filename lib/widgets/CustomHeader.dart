import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class CustomHeader extends StatelessWidget {
  final String heading;

  const CustomHeader({Key key, this.heading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
      padding:
          const EdgeInsets.only(left: 16.0, right: 4.0, top: 16.0, bottom: 0.0),
      width: double.infinity,
      child: Row(
        children: [
          CustomText(
            heading ?? "My Task",
            fontSize: 40.0,
            fontColor: Config.black,
          ),
        ],
      ),
    );
  }
}
