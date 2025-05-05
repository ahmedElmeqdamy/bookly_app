import 'package:booly_new/feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booly_new/feature/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:booly_new/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_error_message.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push('/BookDetailView', extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks!.thumbnail!,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
