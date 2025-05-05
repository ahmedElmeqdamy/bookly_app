import 'package:booly_new/core/errors/failures.dart';
import 'package:booly_new/core/utliti/api_services.dart';
import 'package:booly_new/feature/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../books_model/book_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&orderBy=newest&q=subject:computer science',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (error) {
      // return left(ServerError(error.toString()));
      if (error is DioException) {
        return left(ServerError.fromDioError(error));
      }
      return left(ServerError(error.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    print('4');
    try {
      var data = await apiServices.get(
        //volumes?filter=free-ebooks&q=programming
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming',
      );
      print(data);
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerError.fromDioError(error));
      }
      return left(ServerError(error.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (error) {
      // return left(ServerError(error.toString()));
      if (error is DioException) {
        return left(ServerError.fromDioError(error));
      }
      return left(ServerError(error.toString()));
    }
  }
}
