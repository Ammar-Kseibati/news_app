import 'package:get_it/get_it.dart';
import 'package:news_app/data/datasource/news_remote_data_source.dart';
import 'package:news_app/data/repository/news_rempository.dart';
import 'package:news_app/domain/repository/base_news_repository.dart';
import 'package:news_app/domain/usecase/get_apple_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_buisness_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_tesla_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_wallstreet_articels_usecase.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => NewsBloc(
          sl(),
          sl(),
          sl(),
          sl(),
        ));

    sl.registerLazySingleton(() => GetAppleArticlesUseCase(sl()));
    sl.registerLazySingleton(() => GetBuisnessArticlesUseCase(sl()));
    sl.registerLazySingleton(() => GetTeslaArticlesUseCase(sl()));
    sl.registerLazySingleton(() => GetWallStreetArticlesUseCase(sl()));

    sl.registerLazySingleton<BaseNewsRepository>(() => NewsRepository(sl()));

    sl.registerLazySingleton<BaseNewsRemoteDataSource>(
        () => NewsRemoteDataSource());
  }
}
