import 'package:booly_new/feature/home/data/books_model/book_model.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFailure(this.errorMessage);
}
