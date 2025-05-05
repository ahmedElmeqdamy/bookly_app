import 'package:booly_new/core/utliti/services_locator.dart';
import 'package:booly_new/feature/home/data/repo/home_repo_impl.dart';
import 'package:booly_new/feature/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booly_new/feature/home/presentation/views/home_view.dart';
import 'package:booly_new/feature/search/presentation/views/search_view.dart';
import 'package:booly_new/feature/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/data/books_model/book_model.dart';
import '../../feature/home/presentation/views/widgets/book_detail_view.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: '/HomeView',
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: '/BookDetailView',
        builder: (context,  state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailView(bookModel: state.extra as BookModel,),
          );
        },
      ),
      GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return SearchView();
        },
      ),
    ],
  );
}
