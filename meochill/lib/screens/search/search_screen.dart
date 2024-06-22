import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/repostsitories/size_contanst.dart';
import 'package:meochill/screens/search/cubit/search_cubit.dart';
import 'package:meochill/screens/search/cubit/search_state.dart';
import 'package:meochill/screens/search/widget/search_ideal.dart';
import 'package:meochill/screens/search/widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context.read<Api>())..getTopTrending(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (
                    value
                  ) {
                    if (value.isEmpty) {
                      return;
                    }
                    else{
                      BlocProvider.of<SearchCubit>(context).getResultFilm(value);
                    }
                  }),
              kHeight,
              Expanded(child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                   if (state.loadStatus == LoadStatus.Loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.loadStatus == LoadStatus.Done && state.resultsFilm==false) {
                        return const SearchIdelWidget();
                      } else if(state.loadStatus==LoadStatus.Done&& state.resultsFilm==true){
                        return const SearchResult();
                      }
                      else{
                        return const Center(child: CircularProgressIndicator());
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
