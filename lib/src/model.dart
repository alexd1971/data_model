import 'json_encodable.dart';
import 'object_id.dart';

abstract class Model implements JsonEncodable {
  /// Object identifier
  /// 
  /// If model has no identifier it should be left `null`
  ObjectId id;

  /// Creates Model with optional `id`
  Model([this.id]);

  @override
  Map<String, dynamic> get json => {'id': id?.json}..removeWhere((key, value) => value == null);
}