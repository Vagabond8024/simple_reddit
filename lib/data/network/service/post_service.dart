import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_reddit/core/utils/utils.dart';
import 'package:simple_reddit/data/network/model/data/post_json.dart';
import 'package:simple_reddit/data/network/model/response/base_response.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class PostService {
  factory PostService(Dio dio, {String baseUrl}) = _PostService;

  @GET('top.json')
  Future<HttpResponse<ListResponse<PostJson>>> getPostList(
      @Queries() Map<String, dynamic> query);
}
