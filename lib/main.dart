import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/view/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyTodoListApp());
}

class MyTodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
            primaryColor: Config.primaryColor,
            accentColor: Config.accentColor,
            scaffoldBackgroundColor: Config.scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
                color: Config.appBarColor,
                elevation: 0.0,
                centerTitle: true,
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                )),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            )));
  }
}
