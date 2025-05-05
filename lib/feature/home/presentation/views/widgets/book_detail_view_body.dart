import 'package:booly_new/feature/home/data/books_model/book_model.dart';
import 'package:booly_new/feature/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utliti/font_style.dart';
import 'books_action.dart';
import 'books_can_also_like.dart';
import 'custom_book_detail_app_bar.dart';
import 'custom_list_view_item.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomBookDetailAppbar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.20),
                child: CustomBookImage(
                  imageUrl:
                     bookModel.volumeInfo.imageLinks?.thumbnail??'',
                ),
              ),
              Text(
               bookModel.volumeInfo.title!,
                style: Styles.textStyle30,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Opacity(
                opacity: 0.78,
                child: Text(
                  bookModel.volumeInfo.authors?[0]??'',
                  style: Styles.textStyle20.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 8),
              BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
                rating: bookModel.volumeInfo.averageRating??0,
                count: bookModel.volumeInfo.ratingsCount??0,
              ),
              SizedBox(height: 20),
              BooksAction(bookModel: bookModel,),
              Expanded(child: SizedBox(height: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'you can also like',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 40.0),
                child: BooksCanAlsoLike(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
