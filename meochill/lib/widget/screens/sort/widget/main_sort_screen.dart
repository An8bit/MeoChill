import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/widget/screens/search/widget/main_card.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';

class MainSortScreen extends StatelessWidget {
  const MainSortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bạn có thể thêm các widget khác ở đây nếu cần thiết
        Expanded(
          child: BlocBuilder<SortCubit, SortState>(
            builder: (context, state) {
              if (state.movies.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.4,
                  ),
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    final movie = state.movies[index];
                    return MainCard(
                      id: "id",
                      imageUrl: movie.thumburl ?? 'default_image_url',
                      movie: movie,
                    );
                  },
                );
              }
              return const Center(child: Text("No results found"));
            },
          ),
        ),
      ],
    );
  }
}
