import 'package:easy_control/ext/Components.dart';
import 'package:flutter/material.dart';

class Investments extends StatefulWidget {
  @override
  _InvestmentsState createState() => _InvestmentsState();
}

class _InvestmentsState extends State<Investments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Investimentos"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(context),
      ),
      body: Container(),
    );
  }
}
