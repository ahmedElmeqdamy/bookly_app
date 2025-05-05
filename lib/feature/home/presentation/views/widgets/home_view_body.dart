import 'package:booly_new/feature/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booly_new/feature/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utliti/font_style.dart';

import 'best_seller_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: FeaturedListView(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  textAlign: TextAlign.start,
                  'Newest seller',
                  style: Styles.textStyle20.copyWith(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
