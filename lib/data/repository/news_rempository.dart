import 'package:news_app/core/error/exceptios.dart';
import 'package:news_app/data/datasource/news_remote_data_source.dart';
import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/domain/repository/base_news_repository.dart';

class NewsRepository extends BaseNewsRepository {
  final BaseNewsRemoteDataSource baseNewsRemoteDataSource;

  NewsRepository(this.baseNewsRemoteDataSource);
  @override
  Future<Either<Failure, List<News>>> getAppleArticles() async {
    final result = await baseNewsRemoteDataSource.getAppleArticles();
    try {
      return Right(result);
    } on ServerException catch (failuar) {
      return Left(ServerFailure(failuar.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getBuisnessArticles() async {
    final result = await baseNewsRemoteDataSource.getBuisnessArticles();
    try {
      return Right(result);
    } on ServerException catch (failuar) {
      return Left(ServerFailure(failuar.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getTeslaArticles() async {
    final result = await baseNewsRemoteDataSource.getTeslaArticles();
    try {
      return Right(result);
    } on ServerException catch (failuar) {
      return Left(ServerFailure(failuar.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<News>>> getWallStreetArticles() async {
    final result = await baseNewsRemoteDataSource.getWallStreetArticles();
    try {
      return Right(result);
    } on ServerException catch (failuar) {
      return Left(ServerFailure(failuar.errorMessageModel.message));
    }
  }
}
