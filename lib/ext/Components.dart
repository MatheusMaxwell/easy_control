

import 'package:easy_control/ext/Constants.dart';
import 'package:flutter/material.dart';

drawer(BuildContext context){
  return ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('EASY CONTROL', style: TextStyle(fontSize: 30, color: Colors.white),),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Visão Geral', style: TextStyle(fontSize: 20),),
        onTap: () {
          navigation(Constants.OVERVIEW_PAGE, context);
        },
      ),
      ListTile(
        title: Text('Gastos Essenciais', style: TextStyle(fontSize: 20)),
        onTap: () {
          navigation(Constants.ESSENTIAL_SPENTS_PAGE, context);
        },
      ),
      ListTile(
        title: Text('Outros Gastos', style: TextStyle(fontSize: 20)),
        onTap: () {
          navigation(Constants.OTHER_SPENTS_PAGE, context);
        },
      ),
      ListTile(
        title: Text('Investimentos', style: TextStyle(fontSize: 20)),
        onTap: () {
          navigation(Constants.INVESTMENTS_PAGE, context);
        },
      ),
      ListTile(
        title: Text('Lazer', style: TextStyle(fontSize: 20)),
        onTap: () {
          navigation(Constants.RECREATION_PAGE, context);
        },
      ),
      ListTile(
        title: Text('Configurações', style: TextStyle(fontSize: 20)),
        onTap: () {
          navigation(Constants.SETTINGS_PREFERENCE_PAGE, context);
        },
      ),
    ],
  );
}


Function navigation (String route, BuildContext context){
  Navigator.of(context).pushReplacementNamed(route);
}