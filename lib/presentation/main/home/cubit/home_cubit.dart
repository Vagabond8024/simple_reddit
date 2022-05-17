import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/domain/usecases/get_posts_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPostsUseCase _getPostsUseCase;
  int int_offset = 0;

  HomeCubit(this._getPostsUseCase) : super(HomeState([], true));

  getPosts() async {
    var postList = await _getPostsUseCase(_applyFilters(int_offset));
    int_offset += 5;
    var newArr = state.topPosts + (postList.data?.right ?? []);
    emit(HomeState(newArr, false));
  }

  Map<String, String> _applyFilters(int offset) {
    var filtersMap = {'limit': '5'};
    filtersMap['count'] = offset.toString();
    return filtersMap;
  }
}
