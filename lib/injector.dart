import 'package:get_it/get_it.dart';
import 'package:simple_reddit/core/utils/utils.dart';

final injector = GetIt.instance;

// Future<void> initializeDependencies() async {
//   final database =
//       await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();

//   injector.registerSingleton(database);

//   final sharedPreferences = await SharedPreferences.getInstance();
//   injector.registerSingleton(sharedPreferences);

//   Dio injectDio(SharedPreferences sharedPreferences) {
//     Dio dio = Dio();
//     dio.options.receiveTimeout = 100000;
//     dio.options.sendTimeout = 100000;
//     dio.options.connectTimeout = 100000;

//     dio.options.followRedirects = false;
//     dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       options.headers.addAll({
//         "accept-language": "en",
//         "x-mobile-token-id": sharedPreferences.getString("TOKEN"),
//         "X-Mobile-Request": ""
//       });
//       handler.next(options);
//     }));

//     return dio;
//   }