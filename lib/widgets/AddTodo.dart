import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class AddTodo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  onWillPop: () async {
                    return true;
                  },
                  key: _formKey,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Add Task",
                            fontSize: 40.0,
                            fontColor: Config.black,
                          ),
                          IconButton(
                              icon: Icon(Icons.close_sharp),
                              onPressed: () {
                                Get.close(1);
                              })
                        ],
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Date",
                        ),
                        onTap: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2050),
                              builder: (context, child) => Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.fromSwatch(
                                          primarySwatch: Colors.indigo),
                                      buttonTheme: ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary),
                                    ),
                                    child: child,
                                  ));
                        },
                      ),
                      TextField(
                        decoration:
                            InputDecoration(isDense: true, labelText: "Title"),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      CustomText(
                        "Priority",
                        fontColor: Config.grayWhite,
                        fontSize: 12.0,
                      ),
                      DropdownButton(
                          isExpanded: true,
                          itemHeight: 50,
                          items: [
                            DropdownMenuItem(
                                child: Row(
                              children: [
                                CustomIcon(
                                  Icons.circle,
                                  iconColor: Config.red,
                                ),
                                Text("High"),
                              ],
                            )),
                            DropdownMenuItem(
                                child: Row(
                              children: [
                                CustomIcon(
                                  Icons.circle,
                                  iconColor: Config.yellow,
                                ),
                                Text("Medium"),
                              ],
                            )),
                            DropdownMenuItem(
                                child: Row(
                              children: [
                                CustomIcon(
                                  Icons.circle,
                                  iconColor: Config.green,
                                ),
                                Text("Low"),
                              ],
                            ))
                          ],
                          onChanged: (value) {}),
                      SizedBox(
                        height: 6.0,
                      ),
                      FlatButton.icon(
                        padding: EdgeInsets.all(12.0),
                        color: Config.primaryColor,
                        icon: (Icon(
                          Icons.add,
                          color: Config.white,
                        )),
                        label: CustomText("Add Task", fontColor: Config.white),
                        onPressed: () {},
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
