// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PostService implements PostService {
  _PostService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.reddit.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ListResponse<PostJson>>> getPostList(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ListResponse<PostJson>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListResponse<PostJson>.fromJson(
      _result.data!,
      (json) => PostJson.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
