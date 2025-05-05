import 'package:booly_new/feature/home/data/repo/home_repo.dart';
import 'package:booly_new/feature/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  // FeaturedBooksCubit(super.initialState, this.homeRepo);

  final HomeRepo homeRepo;

  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  Future<void> fetchFeaturedBooks() async {
    print('1');
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failure) {
        print('2');

        emit(FeaturedBooksFailure(failure.errorMessage!));
      },
      (books) {
        print('3');
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
