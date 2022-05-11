import 'dart:io';

import 'package:dio/dio.dart';
import 'package:simple_reddit/core/utils/part.dart';
import 'package:simple_reddit/core/resources/data_state.dart';
import 'package:simple_reddit/data/local/app_database.dart';
import 'package:simple_reddit/data/mappers/post_mappers.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/domain/repository/post_repository.dart';
import 'package:simple_reddit/data/network/service/post_service.dart';

class PostRepositoryImpl implements PostRepository {
  final AppDatabase _appDatabase;
  final PostService _postService;

  PostRepositoryImpl(this._appDatabase, this._postService);

  @override
  Future<DataState<Pair<int, List<Post>>>> getPosts(
      Map<String, String> params) async {
    var mapper = PostMapper();
    try {
      final response = await _postService.getPostList(params);
      final reponseLenght = response.data.data.length;
      
      if (response.response.statusCode == HttpStatus.ok) {
        List<Post> posts = List.empty(growable: true);
        for (var element in response.data.data) {
          var post = await mapper.remoteToDomain(element);
          posts.add(post);
        }
        return DataSuccess(Pair(reponseLenght, posts));
      }
      return DataFailed(DioError(
          requestOptions: response.response.requestOptions,
          response: response.response,
          type: DioErrorType.response,
          error: response.response.statusMessage));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
