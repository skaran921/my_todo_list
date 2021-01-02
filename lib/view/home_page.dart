import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/controller/TodoController.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/utils/customDateTime.dart';
import 'package:my_todo_list/widgets/AddTodo.dart';
import 'package:my_todo_list/widgets/CustomCircleAvatar.dart';
import 'package:my_todo_list/widgets/CustomHeader.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomScaffold.dart';
import 'package:my_todo_list/widgets/CustomText.dart';
import 'package:my_todo_list/widgets/TodoListTile.dart';

class HomePage extends StatelessWidget {
  final _dateTime = DateTime.now();
  final _todoController = Get.put<TodoController>(TodoController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Config.indigo,
        onPressed: () {
          Get.bottomSheet(
            AddTodo(),
            backgroundColor: Config.white,
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          CustomHeader(),
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
                          "${CustomDateTime(_dateTime).getMonthShortName}",
                          fontSize: 18.0,
                          fontColor: Config.grayWhite,
                        ),
                        SizedBox(width: 4.0),
                        CustomText(
                          "${CustomDateTime(_dateTime).getDay}${CustomDateTime(_dateTime).getDay == 1 ? 'st' : CustomDateTime(_dateTime).getDay == 2 ? 'nd' : CustomDateTime(_dateTime).getDay == 3 ? 'rd' : 'th'}",
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
              child: GetX<TodoController>(
                builder: (todoController) {
                  return todoController.isTodoLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : todoController.todos.length.isEqual(0)
                          ? Center(
                              child: CustomText(
                                "No Task Found",
                                fontSize: 20,
                              ),
                            )
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: todoController.todos.length,
                              itemBuilder: (context, index) {
                                return TodoListTile(
                                  titleText: "Todo $index",
                                  // value: true,
                                );
                              });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
