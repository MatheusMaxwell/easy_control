import 'package:easy_control/ext/Components.dart';
import 'package:flutter/material.dart';
class OtherSpents extends StatefulWidget {
  @override
  _OtherSpentsState createState() => _OtherSpentsState();
}

class _OtherSpentsState extends State<OtherSpents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Outros Gastos"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(context),
      ),
      body: Container(),
    );
  }
}
