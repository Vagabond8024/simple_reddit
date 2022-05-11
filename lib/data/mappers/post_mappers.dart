import 'package:simple_reddit/data/mappers/three_way_mapper.dart';
import 'package:simple_reddit/data/network/model/data/post_json.dart';
import 'package:simple_reddit/domain/entities/post.dart';

class PostMapper extends ThreeWayMapper<Post, void, PostJson> {
  @override
  void domainToLocal(Post type) {
    // TODO: implement domainToLocal
  }

  @override
  Post localToDomain(void type) {
    // TODO: implement localToDomain
    throw UnimplementedError();
  }

  @override
  Post remoteToDomain(PostJson type) {
    return Post(
      type.id,
      type.title,
      type.subreddit,
      type.author_fullname,
      type.created_utc,
      type.num_comments,
      type.score,
    );
  }

  @override
  void remoteToLocal(PostJson type) {
    // TODO: implement remoteToLocal
  }
}
