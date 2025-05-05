import 'package:booly_new/feature/home/data/books_model/book_model.dart';
import 'package:booly_new/feature/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utliti/font_style.dart';
import 'book_rating.dart';


class BestSellerFeatureItem extends StatelessWidget {
  const BestSellerFeatureItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/BookDetailView', extra: bookModel);
        },
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 2.8 / 4,
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??'',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        bookModel.volumeInfo.title ?? 'no title',
                        textAlign: TextAlign.start,

                        style: Styles.textStyle18,
                      ),
                    ),
                    Text(
                      bookModel.volumeInfo.authors?.first ?? 'Unknown Author',
                      // bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        BookRating(
                          mainAxisAlignment: MainAxisAlignment.center,
                          rating: bookModel.volumeInfo.averageRating!,
                          count: bookModel.volumeInfo.ratingsCount!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
