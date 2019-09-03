import 'package:easy_control/Pages/Settings/settings_preference.dart';
import 'package:easy_control/Pages/essential_spents/essential_spents.dart';
import 'package:easy_control/Pages/investments/investments.dart';
import 'package:easy_control/Pages/other_spents/other_spents.dart';
import 'package:easy_control/Pages/overview/overview.dart';
import 'package:easy_control/Pages/recreation/recreation.dart';
import 'package:easy_control/ext/Constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final routes ={
  Constants.OVERVIEW_PAGE : (BuildContext context) => new Overview(),
  Constants.ESSENTIAL_SPENTS_PAGE : (BuildContext context) => new EssentialSpents(),
  Constants.OTHER_SPENTS_PAGE : (BuildContext context) => new OtherSpents(),
  Constants.INVESTMENTS_PAGE : (BuildContext context) => new Investments(),
  Constants.RECREATION_PAGE : (BuildContext context) => new Recreation(),
  Constants.SETTINGS_PREFERENCE_PAGE : (BuildContext context) => new SettingsPreference(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gastos',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: routes,
    );
  }
}