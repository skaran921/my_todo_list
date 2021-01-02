import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/utils/customDateTime.dart';
import 'package:my_todo_list/widgets/CustomCircleAvatar.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomScaffold.dart';
import 'package:my_todo_list/widgets/CustomText.dart';
import 'package:my_todo_list/widgets/TodoListTile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Config.indigo,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
            padding: const EdgeInsets.only(
                left: 16.0, right: 4.0, top: 16.0, bottom: 0.0),
            width: double.infinity,
            child: Row(
              children: [
                CustomText(
                  "My Task",
                  fontSize: 40.0,
                  fontColor: Config.black,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 2.0),
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(
              color: Config.white,
              // borderRadius: BorderRadius.circular(6.0),
              border: Config.leftSideBorder,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Good Morning",
                      fontSize: 20.0,
                      fontColor: Config.grayWhite,
                    ),
                    CustomCircleAvatar(
                      text: "K",
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "Karan Soni",
                      fontSize: 18.0,
                      fontColor: Config.grayWhite,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Config.grayWhite,
                        ),
                        onPressed: () {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      "Thursday",
                      fontSize: 20.0,
                      fontColor: Config.grayWhite,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIcon(Icons.calendar_today_rounded),
                        SizedBox(width: 4.0),
                        CustomText(
                          "${CustomDateTime().getMonthShortName}",
                          fontSize: 18.0,
                          fontColor: Config.grayWhite,
                        ),
                        SizedBox(width: 4.0),
                        CustomText(
                          "${CustomDateTime().getDay}${CustomDateTime().getDay == 1 ? 'st' : CustomDateTime().getDay == 2 ? 'nd' : CustomDateTime().getDay == 3 ? 'rd' : 'th'}",
                          fontSize: 18.0,
                          fontColor: Config.grayWhite,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TodoListTile(
                      titleText: "Todo $index",
                      // value: true,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
