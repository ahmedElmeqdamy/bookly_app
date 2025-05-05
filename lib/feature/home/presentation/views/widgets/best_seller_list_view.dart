import 'package:booly_new/core/widgets/custom_error_message.dart';
import 'package:booly_new/core/widgets/custom_loading_indicator.dart';
import 'package:booly_new/feature/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:booly_new/feature/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_feature_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BestSellerFeatureItem(bookModel: state.books[index]);
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
