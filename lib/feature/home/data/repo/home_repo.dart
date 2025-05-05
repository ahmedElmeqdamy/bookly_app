import 'package:booly_new/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../books_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();

  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
