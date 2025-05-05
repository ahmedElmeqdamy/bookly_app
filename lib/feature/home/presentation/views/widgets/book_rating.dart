import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utliti/font_style.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.mainAxisAlignment,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, size: 14),
        SizedBox(width: 9),
        Text(
          '$rating',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 9),
        Opacity(
          opacity: 0.50,
          child: Text(
            '($count)',
            style: Styles.textStyle16.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
