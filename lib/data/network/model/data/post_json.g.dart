// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostJson _$PostJsonFromJson(Map<String, dynamic> json) => PostJson(
      json['author'] as String,
      json['id'] as String,
      json['title'] as String,
      json['created_utc'],
      json['subreddit'] as String,
      json['score'],
      json['num_comments'],
    );

Map<String, dynamic> _$PostJsonToJson(PostJson instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subreddit': instance.subreddit,
      'author': instance.author_fullname,
      'created_utc': instance.created_utc,
      'num_comments': instance.num_comments,
      'score': instance.score,
    };
