import 'package:simple_reddit/core/resources/data_state.dart';
import 'package:simple_reddit/core/utils/part.dart';
import 'package:simple_reddit/domain/entities/post.dart';

abstract class PostRepository {
  Future<DataState<Pair<int, List<Post>>>> getPosts(Map<String, String> params);
}
