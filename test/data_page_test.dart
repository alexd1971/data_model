import 'package:test/test.dart';

import 'package:data_model/data_model.dart';

class TestModelId extends ObjectId {
  TestModelId._(id) : super(id);
  factory TestModelId(id) {
    if (id == null) return null;
    return TestModelId._(id);
  }
}

class TestModel implements Model<TestModelId> {
  TestModelId id;
  String param;
  TestModel({this.id, this.param});
  factory TestModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return TestModel(id: TestModelId(json['id']), param: json['param']);
  }

  Map<String, dynamic> get json => {'id': id?.json, 'param': param};
}

final testModelPageJson = <String, dynamic>{
  'totalCount': 2,
  'data': [
    {'id': 'id1', 'param': 'value1'},
    {'id': 'id2', 'param': 'value2'},
  ]
};

main() {
  test('null totlaCount', () {
    expect(() {
      DataPage<TestModel>(null, []);
    }, throwsArgumentError);
  });

  test('null data', () {
    expect(() {
      DataPage<TestModel>(100, null);
    }, throwsArgumentError);
  });

  test('null json', () {
    expect(() {
      DataPage<TestModel>.fromJson(null, null);
    }, throwsArgumentError);
  });

  test('null json[totlalCount]', () {
    expect(() {
      DataPage<TestModel>.fromJson({'data': []}, null);
    }, throwsArgumentError);
  });

  test('null json[data]', () {
    expect(() {
      DataPage<TestModel>.fromJson({'totlaCount': 100}, null);
    }, throwsArgumentError);
  });

  test('create from json', () {
    final testModelPage = DataPage<TestModel>.fromJson(
        testModelPageJson, (json) => TestModel.fromJson(json));
    expect(testModelPage.totalCount, equals(2));
    expect(testModelPage.data.map((model) => model.json).toList(),
        containsAll(testModelPageJson['data']));
  });

  test('getter json', () {
    final testModelPage = DataPage(
        testModelPageJson['totalCount'],
        List<TestModel>.from(
            testModelPageJson['data'].map((json) => TestModel.fromJson(json))));
    expect(testModelPage.json, testModelPageJson);
  });
}
