import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
  @override
  List<Object> get props => [];
}

class GetAppleArticlesEvent extends NewsEvent {}

class GetBuisnessArticlesEvent extends NewsEvent {}

class GetTeslaArticlesEvent extends NewsEvent {}

class GetWallStreetArticlesEvent extends NewsEvent {}
