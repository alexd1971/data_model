import 'json_encodable.dart';
import 'object_id.dart';

/// Model interface
abstract class Model<ModelId extends ObjectId> implements JsonEncodable {
  /// Object identifier
  /// 
  /// If model has no identifier it should be left `null`
  ModelId id;
}