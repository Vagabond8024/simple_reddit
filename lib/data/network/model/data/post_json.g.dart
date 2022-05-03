// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostJson _$PostJsonFromJson(Map<String, dynamic> json) => PostJson(
      json['author_fullname'] as String,
      json['id'] as String,
      json['title'] as String,
      json['created_utc'] as int,
      json['subreddit'] as String,
      json['score'] as int,
      json['num_comments'] as int,
    );

Map<String, dynamic> _$PostJsonToJson(PostJson instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subreddit': instance.subreddit,
      'author_fullname': instance.author_fullname,
      'created_utc': instance.created_utc,
      'num_comments': instance.num_comments,
      'score': instance.score,
    };
