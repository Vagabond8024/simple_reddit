import 'package:simple_reddit/core/utils/part.dart';
import 'package:simple_reddit/core/resources/data_state.dart';
import 'package:simple_reddit/data/local/app_database.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/domain/repository/post_repository.dart';
import 'package:simple_reddit/data/network/service/post_service.dart';

class PostRepositoryImpl implements PostRepository {
  final AppDatabase _appDatabase;
  final PostService _postService;

  PostRepositoryImpl(this._appDatabase, this._postService);

  @override
  Future<DataState<Pair<int, List<Post>>>> getPosts(
      Map<String, String> params) async{
    
    
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
