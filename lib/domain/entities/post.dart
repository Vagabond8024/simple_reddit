import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String subreddit;
  final String author_fullname;
  final int created_utc;
  final int num_comments;
  final int score;

  Post(
    this.id,
    this.title,
    this.subreddit,
    this.author_fullname,
    this.created_utc,
    this.num_comments,
    this.score,
  );

  @override
  List<Object?> get props => [
        id,
        title,
        subreddit,
        author_fullname,
        created_utc,
        num_comments,
        score,
      ];
}
