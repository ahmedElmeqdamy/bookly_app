import 'package:booly_new/feature/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Search...',
          suffixIcon: FontAwesomeIcons.magnifyingGlass,
        ),
        SizedBox(height: 10),
        Expanded(child: SearchResultListView()),
      ],
    );
  }
}

//Icon(FontAwesomeIcons.magnifyingGlass, size: 25)
