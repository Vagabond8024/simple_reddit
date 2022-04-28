import 'package:floor/floor.dart';

class ListStringConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    return databaseValue.split(",");
  }

  @override
  String encode(List<String> value) {
    return value.join(",");
  }
}

class ListIntConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    return databaseValue.split(",").map((e) => int.parse(e)).toList();
  }

  @override
  String encode(List<int> value) {
    return value.join(",");
  }
}
