

class Spent {
  final int id;
  final double value;
  final int type;

  int get spentId => id;

  double get spentValue => value;

  int get spentType => type;

  Spent({this.id, this.value, this.type});

  Map<String, dynamic> toMap(){
    return{
      'value' : value,
      'type' : type
    };
  }

  static Spent fromMap(Map<String, dynamic> map){
    return Spent(
      value: map['value'],
      type: map['type']
    );
  }
}