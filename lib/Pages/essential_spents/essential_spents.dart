import 'package:easy_control/ext/Components.dart';
import 'package:flutter/material.dart';

class EssentialSpents extends StatefulWidget {
  @override
  _EssentialSpentsState createState() => _EssentialSpentsState();
}

class _EssentialSpentsState extends State<EssentialSpents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gastos Essenciais"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(context),
      ),
      body: Container(),
    );
  }
}
