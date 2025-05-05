import 'package:booly_new/feature/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(String category) async {
    emit(SimilarBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.errorMessage!));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
