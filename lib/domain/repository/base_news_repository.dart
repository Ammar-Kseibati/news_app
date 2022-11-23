import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/domain/entities/news_entity.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, List<News>>> getAppleArticles();
  Future<Either<Failure, List<News>>> getBuisnessArticles();
  Future<Either<Failure, List<News>>> getTeslaArticles();
  Future<Either<Failure, List<News>>> getWallStreetArticles();
}
