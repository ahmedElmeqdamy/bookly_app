import 'package:booly_new/feature/home/data/books_model/book_model.dart';
import 'package:booly_new/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_detail_view_body.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBooks(widget.bookModel.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailViewBody(bookModel: widget.bookModel)),
    );
  }
}
