part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Post> topPosts;
  final bool isLoading;

  HomeState(this.topPosts, this.isLoading);

  @override
  List<Object?> get props => [topPosts, isLoading];
}
