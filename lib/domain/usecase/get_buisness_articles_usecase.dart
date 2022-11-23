import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/domain/entities/news_entity.dart';
import 'package:news_app/domain/repository/base_news_repository.dart';

class GetBuisnessArticlesUseCase {
  final BaseNewsRepository repository;

  GetBuisnessArticlesUseCase(this.repository);
  Future<Either<Failure, List<News>>> call() async {
    return await repository.getBuisnessArticles();
  }
}
