import 'package:booly_new/core/widgets/custom_error_message.dart';
import 'package:booly_new/core/widgets/custom_loading_indicator.dart';
import 'package:booly_new/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booly_new/feature/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class BooksCanAlsoLike extends StatelessWidget {
  const BooksCanAlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
