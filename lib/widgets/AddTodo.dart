import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_todo_list/controller/TodoController.dart';
import 'package:my_todo_list/model/Todo.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/utils/customDateTime.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _todoDateController = TextEditingController();

  TextEditingController _todotitleController = TextEditingController();

  final _priorityValue = ValueNotifier<String>("high");

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    _todoDateController.text = CustomDateTime(date).getDateString;
  }

  void validateTodoForm(context) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      // insert todo in db
      Todo todo = Todo(
          date: _todoDateController.text ?? CustomDateTime(DateTime.now()),
          title: _todotitleController.text,
          priority: _priorityValue.value);
      await Get.find<TodoController>().addTodo(todo);
      Get.dialog(
          AlertDialog(
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset("assets/5449-success-tick.json",
                      width: 100, height: 100, fit: BoxFit.cover),
                  SizedBox(
                    height: 4.0,
                  ),
                  CustomText(
                    "Task Added.",
                    fontSize: 18,
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  child: CustomText(
                    "Close",
                    fontColor: Config.white,
                  ))
            ],
          ),
          transitionCurve: Curves.easeInOut,
          transitionDuration: Duration(milliseconds: 200));
      _todotitleController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height / 1.5,
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
                      TextFormField(
                        controller: _todoDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: "Date",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Date Required.";
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime dateTime = await showDatePicker(
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

                          _todoDateController.text =
                              CustomDateTime(dateTime).getDateString;
                        },
                      ),
                      TextFormField(
                        controller: _todotitleController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Title Required.";
                          }
                          return null;
                        },
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
                      ValueListenableBuilder(
                          valueListenable: _priorityValue,
                          builder: (context, value, widget) {
                            return DropdownButton(
                                isExpanded: true,
                                itemHeight: 50,
                                value: _priorityValue.value,
                                items: Config.prioritiesItems
                                    .map((item) => DropdownMenuItem(
                                        value: item["value"],
                                        child: Row(
                                          children: [
                                            CustomIcon(
                                              Icons.circle,
                                              iconColor: item["iconColor"],
                                            ),
                                            Text("${item["title"]}"),
                                          ],
                                        )))
                                    .toList(),
                                onChanged: (value) {
                                  _priorityValue.value = value;
                                });
                          }),
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
                        onPressed: () {
                          validateTodoForm(context);
                        },
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
