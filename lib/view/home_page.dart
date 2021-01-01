import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/utils/customDateTime.dart';
import 'package:my_todo_list/widgets/CustomCircleAvatar.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomScaffold.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: 160.0,
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
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIcon(
                      Icons.access_time,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CustomText(
                      "${CustomDateTime().getTimeString}",
                      fontSize: 18.0,
                      fontColor: Config.grayWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: 110.0,
            decoration: BoxDecoration(
              color: Config.white,
              border: Config.leftSideBorder,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Thursday",
                      fontSize: 20.0,
                      fontColor: Config.grayWhite,
                    ),
                    CustomText(
                      "${CustomDateTime().getDayString} ${CustomDateTime().getDay == 1 ? 'st' : CustomDateTime().getDay == 2 ? 'nd' : CustomDateTime().getDay == 3 ? 'rd' : 'th'}",
                      fontSize: 20.0,
                      fontColor: Config.grayWhite,
                    ),
                    CustomText(
                      "12 Task",
                      fontColor: Config.grayWhite,
                      fontSize: 20.0,
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Positioned(
                  top: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIcon(Icons.calendar_today_rounded),
                      SizedBox(width: 4.0),
                      CustomText(
                        "${CustomDateTime().getMonthName}",
                        fontSize: 18.0,
                        fontColor: Config.grayWhite,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 0,
                    child: FloatingActionButton(
                      heroTag: "add_todo_btn",
                      onPressed: () {},
                      child: Icon(Icons.add),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        key: ValueKey("todo__row__$index"),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: CustomText(
                          "Todo $index",
                        ),
                        secondary: CustomText("Tue"),
                        value: false,
                        onChanged: (value) {});
                  }),
            ),
          )
        ],
      ),
    );
  }
}
