import 'json_encodable.dart';
import 'model.dart';

/// Page of data models from server
class DataPage<T extends Model> implements JsonEncodable {
  /// Total count of models stored
  int _totalCount;
  int get totalCount => _totalCount;

  /// Data of the page
  List<T> _data;
  List<T> get data => _data;

  DataPage(int totalCount, List<T> data) {
    if (totalCount == null) throw ArgumentError.notNull('totalCount');
    if (data == null) throw ArgumentError.notNull('data');
    _totalCount = totalCount;
    _data = List.unmodifiable(data);
  }

  /// Creates page from JSON
  DataPage.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>) modelFactory) {
    if (json == null) throw ArgumentError.notNull('json');
    if (json['totalCount'] == null) {
      throw ArgumentError.notNull('json[totalCount]');
    }
    if (json['data'] == null) throw ArgumentError.notNull('json[data]');
    _totalCount = json['totalCount'];
    _data = List.unmodifiable(
        (json['data'] as List).map((json) => modelFactory(json)));
  }

  Map<String, dynamic> get json => {
        'totalCount': _totalCount,
        'data': _data.map((model) => model.json).toList()
      };
}
