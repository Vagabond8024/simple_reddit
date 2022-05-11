import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  List<T> data;
  // Map<String, dynamic> meta;

  ListResponse(this.data,); //this.meta

  factory ListResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = <T>[];
    json['data']['children'].forEach((v) {
      data.add(create(v['data']));
    });
    // Map<String, dynamic> meta = {'dist': '$json["data"]'};
    return ListResponse(data);
  }
}
