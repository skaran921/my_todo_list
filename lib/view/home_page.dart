import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomScaffold.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
                color: Config.white, borderRadius: BorderRadius.circular(6.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Good Morning",
                  fontSize: 20.0,
                  fontColor: Config.orange,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
