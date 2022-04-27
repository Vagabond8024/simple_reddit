import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_reddit/domain/entities/post.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  
  HomeCubit() : super(HomeState([], true));
}
