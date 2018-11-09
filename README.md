The package contains tools to implement any data model.

## Usage

A simple usage example:

```dart
import 'package:data_model/data_model.dart';

class PersonId extends ObjectId {
  PersonId._(id) : super(id);

  factory PersonId(id) {
    if (id == null) return null;
    return PersonId._(id);
  }
}

class Person implements Model<PersonId> {
  
  PersonId id;
  String lastName;
  String firstName;

  Person({this.id, this.firstName, this.lastName});

  factory Person.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Person(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName']
    );
  }

  @override
  Map<String, dynamic> get json => {
        'id': id?.json,
        'lastName': lastName,
        'firstName': firstName
      }..removeWhere((key, value) => value == null);
}
```
