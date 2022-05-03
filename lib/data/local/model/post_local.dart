import 'package:floor/floor.dart';

@entity
class PostLocal {
  @primaryKey int id;
  String title;
  String subreddit;
  String author_fullname;
  int created_utc;
  int num_comments;
  int score;

  PostLocal(
    this.id,
    this.title,
    this.subreddit,
    this.author_fullname,
    this.created_utc,
    this.num_comments,
    this.score,
  );
}
