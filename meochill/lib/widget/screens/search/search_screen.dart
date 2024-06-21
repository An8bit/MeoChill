import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';

import 'package:meochill/models/movie.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/search/cubit/search_cubit.dart';
import 'package:meochill/widget/screens/search/cubit/search_state.dart';
import 'package:meochill/widget/screens/search/widget/search_ideal.dart';
import 'package:meochill/widget/screens/search/widget/search_result.dart';

import '../../../repostsitories/size_constants.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  // ignore: non_constant_identifier_names
  static const String route = "SearchScreen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context.read<Api>())..getTopTrending(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   context.read<SearchCubit>().getTopTrending(); });
          return Body();
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      return;
                    }
                  }),
              kHeight,
              Expanded(child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.loadStatus==LoadStatus.Done) {
                   
                    return const SearchIdelWidget();
                  } else {
                    return const SearchResult();
                  }
                },
              ))
              // const Expanded(child: SearchResult())
            ],
          ),
        ),
      ),
    );
  }
}
