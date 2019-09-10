
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  static final String _recipeKey = '_recipe';
  static final String _essentialKey = '_essential';
  static final String _otherKey = '_other';
  static final String _investmentsKey = '_investment';
  static final String _recreationKey = '_recreation';


  static Future<double> getSharedRecipe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_recipeKey) ?? 0.0;
  }

  static Future<bool> setRecipe (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_recipeKey, value);
  }

  static Future<double> getSharedEssential() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_essentialKey) ?? 0.0;
  }

  static Future<bool> setEssential (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_essentialKey, value);
  }

  static Future<double> getSharedOther() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_otherKey) ?? 0.0;
  }

  static Future<bool> setOther (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_otherKey, value);
  }

  static Future<double> getSharedInvestment() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_investmentsKey) ?? 0.0;
  }

  static Future<bool> setInvestment (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_investmentsKey, value);
  }

  static Future<double> getSharedRecreation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_recreationKey) ?? 0.0;
  }

  static Future<bool> setRecreation (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_recreationKey, value);
  }



}