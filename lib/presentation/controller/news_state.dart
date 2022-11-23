import 'package:equatable/equatable.dart';
import 'package:news_app/core/utils/enums.dart';
import 'package:news_app/domain/entities/news_entity.dart';

class NewsState extends Equatable {
  final List<News> appleArticles;
  final RequestState appleArticlesState;
  final String appleArticlesMessage;
  final List<News> buisnessArticles;
  final RequestState buisnessArticlesState;
  final String buisnessArticlesMessage;
  final List<News> teslaArticles;
  final RequestState teslaArticlesState;
  final String teslaArticlesMessage;
  final List<News> wallStreetArticles;
  final RequestState wallStreetArticlesState;
  final String wallStreetArticlesMessage;

  const NewsState({
    this.appleArticles = const [],
    this.appleArticlesState = RequestState.loading,
    this.appleArticlesMessage = "",
    this.buisnessArticles = const [],
    this.buisnessArticlesState = RequestState.loading,
    this.buisnessArticlesMessage = "",
    this.teslaArticles = const [],
    this.teslaArticlesState = RequestState.loading,
    this.teslaArticlesMessage = "",
    this.wallStreetArticles = const [],
    this.wallStreetArticlesState = RequestState.loading,
    this.wallStreetArticlesMessage = "",
  });

  NewsState copyWith({
    List<News>? appleArticles,
    RequestState? appleArticlesState,
    String? appleArticlesMessage,
    List<News>? buisnessArticles,
    RequestState? buisnessArticlesState,
    String? buisnessArticlesMessage,
    List<News>? teslaArticles,
    RequestState? teslaArticlesState,
    String? teslaArticlesMessage,
    List<News>? wallStreetArticles,
    RequestState? wallStreetArticlesState,
    String? wallStreetArticlesMessage,
  }) {
    return NewsState(
      appleArticles: appleArticles ?? this.appleArticles,
      appleArticlesState: appleArticlesState ?? this.appleArticlesState,
      appleArticlesMessage: appleArticlesMessage ?? this.appleArticlesMessage,
      buisnessArticles: buisnessArticles ?? this.buisnessArticles,
      buisnessArticlesState:
          buisnessArticlesState ?? this.buisnessArticlesState,
      buisnessArticlesMessage:
          buisnessArticlesMessage ?? this.buisnessArticlesMessage,
      teslaArticles: teslaArticles ?? this.teslaArticles,
      teslaArticlesState: teslaArticlesState ?? this.teslaArticlesState,
      teslaArticlesMessage: teslaArticlesMessage ?? this.teslaArticlesMessage,
      wallStreetArticles: wallStreetArticles ?? this.wallStreetArticles,
      wallStreetArticlesState:
          wallStreetArticlesState ?? this.wallStreetArticlesState,
      wallStreetArticlesMessage:
          wallStreetArticlesMessage ?? this.wallStreetArticlesMessage,
    );
  }

  @override
  List<Object?> get props => [
        appleArticles,
        appleArticlesMessage,
        appleArticlesState,
        buisnessArticles,
        buisnessArticlesMessage,
        buisnessArticlesState,
        teslaArticles,
        teslaArticlesMessage,
        teslaArticlesState,
        wallStreetArticles,
        wallStreetArticlesMessage,
        wallStreetArticlesState,
      ];
}
