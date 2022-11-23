import 'package:dio/dio.dart';
import 'package:news_app/core/error/exceptios.dart';
import 'package:news_app/core/network/error_message_model.dart';
import 'package:news_app/core/utils/api_constance.dart';
import 'package:news_app/data/models/new_model.dart';
import 'package:news_app/domain/entities/news_entity.dart';

abstract class BaseNewsRemoteDataSource {
  Future<List<News>> getAppleArticles();
  Future<List<News>> getBuisnessArticles();
  Future<List<News>> getTeslaArticles();
  Future<List<News>> getWallStreetArticles();
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  @override
  Future<List<News>> getAppleArticles() async {
    final response = await Dio().get(ApiConstance.appleArticlesPath);
    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<News>> getBuisnessArticles() async {
    final response = await Dio().get(ApiConstance.buisnessArticlesPath);

    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<News>> getTeslaArticles() async {
    final response = await Dio().get(ApiConstance.teslaArticlesPath);

    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }

  @override
  Future<List<News>> getWallStreetArticles() async {
    final response = await Dio().get(ApiConstance.wallStreetArticlesPath);

    if (response.statusCode == 200) {
      return List<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data));
    }
  }
}
