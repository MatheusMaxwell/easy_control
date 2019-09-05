
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  static final String _recipeKey = 'recipe';


  static Future<double> getRecipe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_recipeKey) ?? 0.0;
  }

  static Future<bool> setRecipe (double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_recipeKey, value);
  }



}