import 'package:easy_control/Utils/SharedPreferencesHelper.dart';
import 'package:easy_control/ext/Components.dart';
import 'package:easy_control/ext/Components.dart' as prefix0;
import 'package:easy_control/ext/Constants.dart';
import 'package:flutter/material.dart';

class SettingsPreference extends StatefulWidget {
  @override
  _SettingsPreferenceState createState() => _SettingsPreferenceState();
}

class _SettingsPreferenceState extends State<SettingsPreference> {

  var essencialValue = 0.0;
  var otherValue = 0.0;
  var investmentsValue = 0.0;
  var recreationValue = 0.0;
  double recipe = 0.0;
  var maxValuePercent = 100.0;
  var textRecipe = TextEditingController();
  Slider sliderEssential;
  Slider sliderOther;
  Slider sliderInvestment;
  Slider sliderRecreation;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Configurações"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(context),
      ),
      body: _body()
    );
  }

  _body(){
    var recipeFormat = recipe.toStringAsFixed(2);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Receita Total: ", style: TextStyle(color: Colors.white, fontSize: 25, )),
                    Text(r"R$ "+"$recipeFormat", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: ()async{
                        var reci = await _showDialogEditRecipe(context);
                        setState(() {
                          recipe = double.parse(reci);
                        });
                      },
                      child:  Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Icon( Icons.edit, color: Colors.white,),
                      )
                    ),
                  ],
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("Organize a porcentagem dos gastos", style: TextStyle(fontSize: 20),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 2.0),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: <Widget>[
                  _item("Gastos Essenciais", Constants.ESSENTIAL),
                  _item("Outros Gastos", Constants.OTHER),
                  _item("Investimentos", Constants.INVESTMENTS),
                  _item("Lazer", Constants.RECREATION),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(r"R$ "+calculateTotal().toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 20,
                                color: color(),
                            ),
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: saveValues,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.blue,
                child: Text("Salvar", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
          )

        ],
      ),
    );
  }

  saveValues()async{
    if(calculateTotal() > recipe){
      showSnackBar("O valor total é maior que sua receita.", scaffoldKey);
    }
    else{
      if( await SharedPreferencesHelper.setRecipe(recipe) &&
          await SharedPreferencesHelper.setEssential(essencialValue) &&
          await SharedPreferencesHelper.setOther(otherValue) &&
          await SharedPreferencesHelper.setInvestment(investmentsValue) &&
          await SharedPreferencesHelper.setRecreation(recreationValue)){

        showSnackBar("Salvo", scaffoldKey);

      }
    }
  }

  color(){
    if(calculateTotal() > recipe){
      return Colors.red;
    }
    return Colors.green;
  }

  double calculateTotal(){
    return calculateValue(essencialValue.round())+
        calculateValue(otherValue.round())+
        calculateValue(investmentsValue.round())+
        calculateValue(recreationValue.round());
  }

getSharedPreferences(){
    SharedPreferencesHelper.getSharedRecipe().then((value){
      setState(() {
        recipe = value;
      });
    });
    
    SharedPreferencesHelper.getSharedEssential().then((value){
      setState(() {
        essencialValue = value;
      });
    });

    SharedPreferencesHelper.getSharedOther().then((value){
      setState(() {
        otherValue = value;
      });
    });

    SharedPreferencesHelper.getSharedInvestment().then((value){
      setState(() {
        investmentsValue = value;
      });
    });

    SharedPreferencesHelper.getSharedRecreation().then((value){
      setState(() {
        recreationValue = value;
      });
    });
    
}

  Future<String> _showDialogEditRecipe(BuildContext context) async{
    String recipeValue = '';
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          content: Container(
            child: TextField(
                decoration: new InputDecoration(
                    hintText: 'Renda total'
                ),
              onChanged: (value) {
                  recipeValue = value;
              },
              autofocus: true,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(recipeValue);
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );

  }

  _item(String text, int type){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(text, style: TextStyle(fontSize: 18),),
        ),
        Row(
          children: <Widget>[
            _flexibleSlider(type),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: _textSlider(type),
                  )
              ),
            )
          ],
        )
      ],
    );
  }

  _flexibleSlider(int type){
    return Flexible(
      flex: 1,
      child: _slider(type),
    );
  }

  _textSlider(int type){
    if(type == Constants.ESSENTIAL){
      return Text(r"R$ "+calculateValue(essencialValue.round()).toStringAsFixed(2), style: TextStyle(fontSize: 15),);
    }
    if(type == Constants.OTHER){
      return Text(r"R$ "+calculateValue(otherValue.round()).toStringAsFixed(2), style: TextStyle(fontSize: 15),);
    }
    if(type == Constants.INVESTMENTS){
      return Text(r"R$ "+calculateValue(investmentsValue.round()).toStringAsFixed(2), style: TextStyle(fontSize: 15),);
    }

    return Text(r"R$ "+calculateValue(recreationValue.round()).toStringAsFixed(2), style: TextStyle(fontSize: 15),);
  }

  _slider(int type){
    Slider slider;
    if(type == Constants.ESSENTIAL){
      slider = Slider(
        activeColor: Colors.indigoAccent,
        label: essencialValue.round().toString()+"%",
        divisions: 100,
        onChangeEnd: (value){
            maxValuePercent = maxValuePercent - value;
            print("valor: "+maxValuePercent.toString());
        },
        min: 0.0,
        max: 100.0,
        onChanged: (newRating) {
            setState(() => essencialValue = newRating);
        },
        value: essencialValue,
      );
    }
    else if(type == Constants.OTHER){
      slider = Slider(
        activeColor: Colors.indigoAccent,
        label: otherValue.round().toString()+"%",
        divisions: 100,
        onChangeEnd: (value){
          maxValuePercent = maxValuePercent - value;
          print("valor: "+maxValuePercent.toString());
        },
        min: 0.0,
        max: 100.0,
        onChanged: (newRating) {
          setState(() => otherValue = newRating);
        },
        value: otherValue,
      );
    }
    else if(type == Constants.INVESTMENTS){
      slider = Slider(
        activeColor: Colors.indigoAccent,
        label: investmentsValue.round().toString()+"%",
        divisions: 100,
        onChangeEnd: (value){
          maxValuePercent = maxValuePercent - value;
          print("valor: "+maxValuePercent.toString());
        },
        min: 0.0,
        max: 100.0,
        onChanged: (newRating) {
          setState(() => investmentsValue = newRating);
        },
        value: investmentsValue,
      );
    }
    else if(type == Constants.RECREATION){
      slider = Slider(
        activeColor: Colors.indigoAccent,
        label: recreationValue.round().toString()+"%",
        divisions: 100,
        onChangeEnd: (value){
          maxValuePercent = maxValuePercent - value;
          print("valor: "+maxValuePercent.toString());
        },
        min: 0.0,
        max: 100.0,
        onChanged: (newRating) {
          setState(() => recreationValue = newRating);
        },
        value: recreationValue,
      );
    }

    return slider;

  }

  double calculateValue(int sliderValue){
    return recipe*sliderValue/100;
  }
}
