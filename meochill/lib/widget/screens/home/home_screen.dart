import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meochill/common/enum/load_status.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/home/cubit/home_cubit.dart';
import 'package:meochill/widget/screens/home/widget/list_home_movie.dart';

import '../../../models/movie.dart';
import '../search/search_screen.dart';

class filmScreen extends StatefulWidget {
  const filmScreen({super.key});
  @override
  State<filmScreen> createState() => _filmScreenState();
}

class _filmScreenState extends State<filmScreen> {
  final List<String> bannerUrls = [
    "https://img.ophim.live/uploads/movies/cach-cuop-ngan-hang-poster.jpg",
    "https://img.ophim.live/uploads/movies/joker-dien-co-doi-poster.jpg",
    "https://img.ophim.live/uploads/movies/lang-ma-am-poster.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit(context.read<Api>())..getTopTrending(),
      child: Main(context, size),
    );
  }

  Scaffold Main(BuildContext context, Size size) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies World"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SearchScreen()));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.25,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      bannerUrls[index],
                      fit: BoxFit.contain,
                    );
                  },
                  itemCount: bannerUrls.length,
                  pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.red,
                    color: Colors.white,
                  )),
                  autoplay: true,
                  autoplayDelay: 3000,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListTopMovie(context),
            ],
          ),
        ));
  }
}

ListTopMovie(context) {
  var size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: size.height,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.loadStatus == LoadStatus.Done &&
                  state.moviestoptrend.isNotEmpty) {
                return ListHomeMovies(
                  listtoptrending: state.moviestoptrend,
                  listrecommand: state.moviesrecommand,
                );
              } else if (state.loadStatus == LoadStatus.Loading) {
                return const Center(
                  child: SpinKitChasingDots(
                    color: Colors.blue,
                  ),
                );
              } else {
                return const Center(
                  child: Text("error"),
                );
              }
            },
          ),
        )
      ],
    ),
  );
}







     
    // MainItem(nowShowingMovies: nowShowingMovies)





