import 'package:data_model/data_model.dart';

class PersonId extends ObjectId {
  PersonId._(id) : super(id);

  factory PersonId(id) {
    if (id == null) return null;
    return PersonId._(id);
  }
}

class Person extends Model {
  
  String lastName;
  String firstName;

  Person({PersonId id, this.firstName, this.lastName}): super(id);

  factory Person.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Person(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName']
    );
  }

  @override
  Map<String, dynamic> get json => super.json..addAll({
        'lastName': lastName,
        'firstName': firstName
      })..removeWhere((key, value) => value == null);
}
