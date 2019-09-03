import 'package:easy_control/ext/Components.dart';
import 'package:flutter/material.dart';

class Recreation extends StatefulWidget {
  @override
  _RecreationState createState() => _RecreationState();
}

class _RecreationState extends State<Recreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lazer"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(context),
      ),
      body: Container(),
    );
  }
}
