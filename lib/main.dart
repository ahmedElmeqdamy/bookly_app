import 'package:booly_new/core/utliti/routes.dart';
import 'package:booly_new/core/utliti/services_locator.dart';

import 'package:booly_new/feature/home/data/repo/home_repo_impl.dart';
import 'package:booly_new/feature/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booly_new/feature/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const booklyApp());
}

class booklyApp extends StatelessWidget {
  const booklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                    ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<HomeRepoImpl>())
                    ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100820),
          textTheme: GoogleFonts.montagaTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
