import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_todo_list/controller/TodoController.dart';
import 'package:my_todo_list/model/Todo.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/utils/customDateTime.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomScaffold.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class UpdateTodo extends StatefulWidget {
  final Todo todo;
  final int index;

  const UpdateTodo({Key key, this.todo, this.index}) : super(key: key);

  @override
  _UpdateTodoState createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _todoDateController = TextEditingController();

  TextEditingController _todotitleController = TextEditingController();

  final _priorityValue = ValueNotifier<String>("high");

  @override
  void initState() {
    super.initState();
    _todoDateController.text = widget.todo.date;
    _todotitleController.text = widget.todo.title;
    _priorityValue.value = widget.todo.priority;
  }

  void _validateUpdateTodoForm(context) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      // insert todo in db
      Todo todo = Todo(
          id: widget.todo.id,
          date: _todoDateController.text ?? CustomDateTime(DateTime.now()),
          title: _todotitleController.text,
          priority: _priorityValue.value,
          isDone: widget.todo.isDone);
      await Get.find<TodoController>().updateTodo(todo, widget.index);
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
                    "Task Updated.",
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
                  ))
            ],
          ),
          transitionCurve: Curves.easeInOut,
          transitionDuration: Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
          padding: const EdgeInsets.only(
              left: 16.0, right: 4.0, top: 16.0, bottom: 0.0),
          child: Row(
            children: [
              IconButton(
                icon: CustomIcon(
                  Icons.arrow_back,
                  iconColor: Config.black,
                  iconSize: 30,
                ),
                onPressed: () {
                  Get.close(1);
                },
              ),
              CustomText(
                "Update Task",
                fontSize: 40.0,
                fontColor: Config.black,
              ),
            ],
          ),
        ),
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
                        Icons.save,
                        color: Config.white,
                      )),
                      label: CustomText("Update Task", fontColor: Config.white),
                      onPressed: () {
                        _validateUpdateTodoForm(context);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton.icon(
                      padding: EdgeInsets.all(12.0),
                      color: Config.primaryColor,
                      icon: (Icon(
                        Icons.arrow_back,
                        color: Config.white,
                      )),
                      label: CustomText("Go Back", fontColor: Config.white),
                      onPressed: () {
                        Get.close(1);
                      },
                    )
                  ],
                )),
          ),
        )
      ],
    ));
  }
}
