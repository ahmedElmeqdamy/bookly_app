import 'package:booly_new/feature/home/data/books_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel? bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              text: '19.99\$',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              backgroundColor: Colors.white,
              textColor: Colors.black, onPressed: () {  },

            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                final Uri url = Uri.parse(bookModel!.volumeInfo.previewLink!);

                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
              text: 'Free preview',
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              backgroundColor: Colors.red,
              textColor: Colors.white,

            ),
          ),
        ],
      ),
    );
  }
}
