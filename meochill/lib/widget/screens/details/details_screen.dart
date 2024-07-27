import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:meochill/widget/navigator/navigartor.dart';

import 'package:meochill/widget/screens/details/comment.dart';
import 'package:meochill/widget/screens/details/round_text_widget.dart';
import 'package:meochill/widget/screens/details/video_screen.dart';
import 'package:meochill/widget/screens/favorite/cubit/favorite_cubit.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_cubit.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_state.dart';

import '../../../common/enum/load_status.dart';
import '../../../models/movie.dart';
import '../../../repostsitories/api.dart';
import '../premium/premium_screen.dart';

import 'cubit/details_cubit.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key, required this.movie});

  static const String route = "MovieDetailScreen";

  final Movie movie;

  // MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    final List<String> actorList =
        movie.actor?.where((actor) => actor != null).cast<String>().toList() ??
            [];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              DetailsCubit(context.read<Api>())..getNameCategory(movie),
        ),
        BlocProvider(
          create: (context) =>
              FavoriteCubit(context.read<Api>())..checkFavorite(movie.id!),
        ),
        BlocProvider(
          create: (context) =>
              PremiumCubit(context.read<Api>())..checkFilmPremium(movie.id!),
        )
      ],
      child: Main(
        movie: movie,
        actorList: actorList,
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    super.key,
    required this.movie,
    required this.actorList,
  });

  final Movie movie;
  final List<String> actorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieHeader(
              imageUrl: movie.posterurl!,
            ),
            MovieInfo(
              movie: movie,
            ),
            MovieDescription(
              description: movie.content!,
            ),

            const Text('Danh sách tập phim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            BlocBuilder<PremiumCubit, PremiumState>(
              builder: (context, state) {
                if (!state.isPremium && state.isMoviePremium) {
                  Future.microtask(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumScreen(),
                      ),
                    );
                  });
                  return SizedBox.shrink(); // Trả về một widget trống tạm thời
                }else if(state.isguestLecture && state.isMoviePremium){
                    
                 return const Center(child:Text("Mua vip đê"));
                }else if(state.loadStatus==LoadStatus.Error){
                  return const Center(child:Text("Lỗi tải dữ liệu"));

                }
                return EpisodeGrid();
              },
            ), // Thêm widget này vào Column để hiển thị các tập phim
            OtherMovies(otherMovies: actorList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => CommentSection(),
          );
        },
        child: Icon(Icons.comment),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class MovieHeader extends StatelessWidget {
  final String imageUrl;

  MovieHeader({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(imageUrl,
              fit: BoxFit.cover, width: double.infinity, height: 300),
          IconButton(
            icon:
                Icon(Icons.play_circle_outline, size: 60, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MovieInfo extends StatelessWidget {
  final Movie movie;

  MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.Loading) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.name!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 10,
                children: [
                  if (state.NameCategory.isNotEmpty)
                    ...state.NameCategory.map((e) => Chip(label: Text(e)))
                        .toList()
                  else
                    Text('No categories available'),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundText(
                        text: 'Length:${movie.time!}',
                      ),
                      RoundText(text: 'Language: ${movie.lang!}'),
                      RoundText(text: 'Year: ${movie.year.toString()}'),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline_sharp,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.telegram_rounded,
                        size: 30,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: state.isFavorite ||
                                    state.loadStatus == LoadStatus.Loading
                                ? null // Nếu phim đã được yêu thích hoặc đang tải, không cho phép ấn
                                : () {
                                    context
                                        .read<FavoriteCubit>()
                                        .addFavorite(movie.id!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Added to Favorites!"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                            icon: state.loadStatus == LoadStatus.Loading
                                ? const SpinKitDualRing(
                                    size: 30,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    state.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                    color: state.isFavorite
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class MovieDescription extends StatelessWidget {
  final String description;

  MovieDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: HtmlWidget(
        description,
      ),
      // ReadMoreText(
      //   description,
      //   trimMode: TrimMode.Line,
      //   trimLines: 2,
      //   colorClickableText: Colors.pink,
      //   trimCollapsedText: 'Hiện thêm',
      //   trimExpandedText: 'Rút gọn',
      //   moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      // ),
    );
  }
}

class EpisodeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.Loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          height: 170, // Thiết lập chiều cao cho GridView
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Số cột
              childAspectRatio: 2.0, // Tỷ lệ khung hình của mỗi ô
              mainAxisSpacing: 10, // Khoảng cách chính giữa các ô
              crossAxisSpacing: 10, // Khoảng cách phụ giữa các ô
            ),
            itemCount: state.episodes.first.serverdata?.length ??
                1, // Số lượng tập từ 1 đến 12
            itemBuilder: (BuildContext context, int index) {
              final String link =
                  state.episodes.first.serverdata?[index].link_embed ??
                      'Unknown';
              final String episodenumber =
                  state.episodes.first.serverdata?[index].slug ?? 'Unknown';
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VideoScreen(link: link, episode: episodenumber)),
                  );
                  // Handle tap event here
                  print(
                      'Tapped on episode ${state.episodes.first.serverdata?[index].link_embed ?? 'Unknown'}');
                },
                child: Card(
                  child: Center(
                    child: Text('Tập ${episodenumber}'),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class OtherMovies extends StatelessWidget {
  final List<String> otherMovies;

  OtherMovies({required this.otherMovies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cast',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10), // Add some space
          Container(
            height: 200, // Đặt chiều cao cố định cho danh sách ngang
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: otherMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 140, // Đặt chiều rộng cho mỗi container phim
                  child: Card(
                    child: Stack(
                      children: [
                        // Ảnh nền
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://media.istockphoto.com/id/515930993/vi/vec-to/h%C3%ACnh-b%C3%B3ng-%C4%91%E1%BA%A7u-v%C3%A0-vai-c%E1%BB%A7a-ng%C6%B0%E1%BB%9Di-%C4%91%C3%A0n-%C3%B4ng-v%E1%BB%9Bi-vect%C6%A1-d%E1%BA%A5u-hi%E1%BB%87u-excalmation.jpg?s=612x612&w=0&k=20&c=-QnM1-GdYjouRaEUNz92Mdw6ubvS_9Ra12_YB8nF5eI="),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Text hiển thị trên ảnh nền
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              otherMovies[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
