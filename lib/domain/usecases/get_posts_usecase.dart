import 'package:simple_reddit/core/resources/data_state.dart';
import 'package:simple_reddit/core/usecases/usecase.dart';
import 'package:simple_reddit/core/utils/part.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/domain/repository/post_repository.dart';

class GetPostsUseCase
    extends UseCase<DataState<Pair<int, List<Post>>>, Map<String, String>> {
  final PostRepository _postRepository;
  GetPostsUseCase(this._postRepository);

  @override
  Future<DataState<Pair<int, List<Post>>>> call(
      Map<String, String> params) async {
    return _postRepository.getPosts(params);
  }
}
