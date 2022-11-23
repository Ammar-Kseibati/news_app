import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/enums.dart';
import 'package:news_app/domain/usecase/get_apple_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_buisness_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_tesla_articles_usecase.dart';
import 'package:news_app/domain/usecase/get_wallstreet_articels_usecase.dart';
import 'package:news_app/presentation/controller/news_event.dart';
import 'package:news_app/presentation/controller/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetAppleArticlesUseCase getAppleArticlesUseCase;
  final GetBuisnessArticlesUseCase getBuisnessArticlesUseCase;
  final GetTeslaArticlesUseCase getTeslaArticlesUseCase;
  final GetWallStreetArticlesUseCase getWallStreetArticlesUseCase;
  NewsBloc(this.getAppleArticlesUseCase, this.getBuisnessArticlesUseCase,
      this.getTeslaArticlesUseCase, this.getWallStreetArticlesUseCase)
      : super(const NewsState()) {
    on<GetAppleArticlesEvent>(_getAppleArticles);
    on<GetBuisnessArticlesEvent>(_getBuisnessArticles);
    on<GetTeslaArticlesEvent>(_getTeslaArticles);
    on<GetWallStreetArticlesEvent>(_getWallStreetArticles);
  }

  FutureOr<void> _getAppleArticles(
      GetAppleArticlesEvent event, Emitter<NewsState> emit) async {
    final result = await getAppleArticlesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        appleArticlesState: RequestState.error,
        appleArticlesMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        appleArticles: r,
        appleArticlesState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getBuisnessArticles(
      GetBuisnessArticlesEvent event, Emitter<NewsState> emit) async {
    final result = await getBuisnessArticlesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        buisnessArticlesState: RequestState.error,
        buisnessArticlesMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        buisnessArticles: r,
        buisnessArticlesState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getTeslaArticles(
      GetTeslaArticlesEvent event, Emitter<NewsState> emit) async {
    final result = await getTeslaArticlesUseCase();

    result.fold(
      (l) => emit(state.copyWith(
        teslaArticlesState: RequestState.error,
        teslaArticlesMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        teslaArticles: r,
        teslaArticlesState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getWallStreetArticles(
      GetWallStreetArticlesEvent event, Emitter<NewsState> emit) async {
    final result = await getWallStreetArticlesUseCase();
    result.fold(
      (l) => emit(state.copyWith(
        wallStreetArticlesState: RequestState.error,
        wallStreetArticlesMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        wallStreetArticles: r,
        wallStreetArticlesState: RequestState.loaded,
      )),
    );
  }
}
