import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(
        "test",
        style: GoogleFonts.pacifico(),
      )),
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader
          ],
        ),
      ),
    ));
  }
}
