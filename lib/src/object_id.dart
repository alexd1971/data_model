import 'package:quiver_hashcode/hashcode.dart';

import 'json_encodable.dart';

/// Object identifier
///
/// Incapsulates identifiers of any type.
///
/// Identifiers can be compared
///
/// For concreete objects you need to create its own identifier class based on [ObjectId].
///
/// Example:
///
///     class UserId extends ObjectId {
///       UserId._(id): super(id);
///       factory UserId(id) {
///         if (id == null) return null;
///         return User._(id);
///       }
///     }
abstract class ObjectId implements JsonEncodable {
  var _id;

  ObjectId(id) {
    if (id == null) throw (ArgumentError.notNull('id'));
    _id = id;
  }

  /// Original value of identificator
  dynamic get value => _id;

  @override
  dynamic get json {
    if (_id is num || _id is String) return _id;
    return _id.toString();
  }

  @override
  bool operator ==(other) {
    if (other is ObjectId)
      return this.runtimeType == other.runtimeType && _id == other._id;
    return false;
  }

  @override
  int get hashCode => hash2(this.runtimeType, _id);

  @override
  String toString() => _id.toString();
}
