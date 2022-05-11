import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/domain/usecases/get_posts_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPostsUseCase _getPostsUseCase;

  HomeCubit(this._getPostsUseCase) : super(HomeState([], true));

  getPosts() async {
    var postList = await _getPostsUseCase(_applyFilters());

    emit(HomeState(postList.data?.right ?? [], false));
  }

  Map<String, String> _applyFilters() {
    var filtersMap = {'limit': '5'};
    filtersMap['count'] = '0';
    return filtersMap;
  }
}
