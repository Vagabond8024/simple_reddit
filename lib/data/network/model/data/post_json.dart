import 'package:json_annotation/json_annotation.dart';

part 'post_json.g.dart';

@JsonSerializable()
class PostJson {
  String id;
  String title;
  String subreddit;
  String author_fullname;
  dynamic created_utc;
  dynamic num_comments;
  dynamic score;

  PostJson(
    this.author_fullname,
    this.id,
    this.title,
    this.created_utc,
    this.subreddit,
    this.score,
    this.num_comments
  );

  factory PostJson.fromJson(Map<String, dynamic> json) =>
      _$PostJsonFromJson(json);
  Map<String, dynamic> toJson() => _$PostJsonToJson(this);
}
