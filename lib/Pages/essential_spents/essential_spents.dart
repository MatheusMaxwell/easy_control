import 'package:easy_control/Utils/SharedPreferencesHelper.dart';
import 'package:easy_control/data/data_base.dart';
import 'package:easy_control/ext/Components.dart';
import 'package:easy_control/models/spent.dart';
import 'package:flutter/material.dart';

class EssentialSpents extends StatefulWidget {
  @override
  _EssentialSpentsState createState() => _EssentialSpentsState();
}

class _EssentialSpentsState extends State<EssentialSpents> {
  double recipeAvailable = 0.0;
  double essentialValueUsed = 0.0;
  var essentialPercent = 0.0;
  List<Spent> spents = List<Spent>();
  DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    insertItem();
    getSharedPreferences();
    getSpents();
  }

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
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  _body(){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _containerHeader(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(r"Você ainda pode usar R$ "+(recipeAvailable - essentialValueUsed).toString(),
              style: TextStyle(fontSize: 25),),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: _listView(),
          )
        ],
      ),

    );
  }

  _listView(){
    return ListView.builder(
        itemCount: spents.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position){
          return _itemList(spents[position]);
        }
    );
  }

  insertItem(){
    var spent = Spent();
    spent.description = "teste";
    spent.value = 15.0;
    spent.date = DateTime.parse("10/12/1234");

    db.insertSpent(spent);

  }

  _itemList(Spent spent){
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(spent.description, style: TextStyle(fontSize: 15),),
          Text(spent.value.toString(), style: TextStyle(fontSize: 15),),
          Text(spent.date.toString(), style: TextStyle(fontSize: 10),),
          Icon(Icons.edit),
          Icon(Icons.delete)
        ],
      ),
    );
  }

  _containerHeader(){
    return Container(
    alignment: Alignment.bottomRight,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(r"Valor Máximo  -  R$ "+recipeAvailable.toStringAsFixed(2), style: TextStyle(fontSize: 25, color: Colors.white),),
                  Text(r"Valor Usado  -  R$ "+essentialValueUsed.toString(), style: TextStyle(fontSize: 25, color: Colors.white),)
                ],
              )
            ],
          )
      ),
    );
  }

  getSpents() async{
    spents = await db.getSpents();
  }

  calculateEssentialValue(){
    recipeAvailable = (recipeAvailable*essentialPercent/100).toDouble();
  }

  getSharedPreferences() async{
    await SharedPreferencesHelper.getSharedRecipe().then((value){
      setState(() {
        recipeAvailable = value;
      });
    });

    await SharedPreferencesHelper.getSharedEssential().then((value){
      setState(() {
        essentialPercent = value;
      });
    });

    calculateEssentialValue();
  }
}
