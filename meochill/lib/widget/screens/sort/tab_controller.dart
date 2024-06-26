import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';
import 'package:meochill/widget/screens/sort/widget/main_sort_screen.dart';


class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortCubit(context.read<Api>()),
      child: Main(),
    );
  }
}

DefaultTabController Main() {
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          tabs: [
             Tab(
              child: Text(
                "Hoạt Hình ",
                style: TextStyle(color: Colors.white),
              ),
            ),
             Tab(
              child: Text(
                "Hành Động",
                style: TextStyle(color: Colors.white),
              ),
            ),
             Tab(
              child: Text(
                "Hài Kịch",
                style: TextStyle(color: Colors.white),
              ),
            ),
             Tab(
              child: Text(
                "Tinh Cảm",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body:const TabBarView(
        children:  [
          TabContent(tabType: "hoathinh"),
          TabContent(tabType: "hanhdong"),
          TabContent(tabType: "hai"),
          TabContent(tabType: "tinhcam"),
        ],
      ),
    ),
  );
}
  
class TabContent extends StatelessWidget {
  final String tabType;

  const TabContent({Key? key, required this.tabType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SortCubit>(context);
    cubit.getTypeMovie(tabType);

    return RefreshIndicator(
      child: BlocBuilder<SortCubit, SortState>(
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadStatus == LoadStatus.Error) {
            return const Center(child: Text('Error'));
          } else {
            // Replace with your UI for each tab type
            return const MainSortScreen();
            }
          }
      ),
      onRefresh: () async {
        cubit.getTypeMovie(tabType);
      },
    );
  }
}
