import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_reddit/core/utils/utils.dart';
import 'package:simple_reddit/data/local/app_database.dart';
import 'package:simple_reddit/data/repository/post_repository_impl.dart';
import 'package:simple_reddit/domain/repository/post_repository.dart';
import 'package:simple_reddit/domain/usecases/get_posts_usecase.dart';
import 'package:simple_reddit/presentation/main/home/cubit/home_cubit.dart';
import 'package:simple_reddit/data/network/service/post_service.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();

  injector.registerSingleton(database);

  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerSingleton(sharedPreferences);

  Dio injectDio(SharedPreferences sharedPreferences) {
    Dio dio = Dio();
    // dio.options.receiveTimeout = 100000;
    // dio.options.sendTimeout = 100000;
    // dio.options.connectTimeout = 100000;

    // dio.options.followRedirects = false;
    // dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    //   options.headers.addAll({
    //     "accept-language": "en",
    //   });
    //   handler.next(options);
    // }));

    return dio;
  }

  //network
  injector.registerSingleton<Dio>(injectDio(injector()));

  //Services
  injector.registerSingleton<PostService>(PostService(injector()),
      signalsReady: true);

  //Repositories
  injector.registerSingleton<PostRepository>(
      PostRepositoryImpl(injector(), injector()));

  //UseCases
  injector.registerSingleton<GetPostsUseCase>(GetPostsUseCase(injector()));

  //Cubits
  injector.registerFactory(() => HomeCubit(injector()));
}
