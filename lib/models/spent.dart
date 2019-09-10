

class Spent {
  int id;
  double value;
  int type;
  String description;
  DateTime date;

  int get spentId => id;

  double get spentValue => value;

  int get spentType => type;

  String get spentDescription => description;

  DateTime get spentDate => date;

  Spent({this.id, this.value, this.type, this.description, this.date});

  Map<String, dynamic> toMap(){
    return{
      'value' : value,
      'type' : type,
      'description' : description,
      'date' : date
    };
  }

  static Spent fromMap(Map<String, dynamic> map){
    return Spent(
      value: map['value'],
      type: map['type'],
      description: map['description'],
      date: map['date']
    );
  }
}