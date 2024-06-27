import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';
import 'package:meochill/widget/screens/sort/widget/main_sort_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    length: 8,
   
    child: Scaffold(
      appBar: AppBar(
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
             Tab(
              child: Text(
                "Hành Động",
               
              ),
            ),
             Tab(
              child: Text(
                "Phiêu Lưu",
                
              ),
            ),
             Tab(
              child: Text(
                "Hài Hước",
                
              ),
            ),
             Tab(
              child: Text(
                "Tinh Cảm",
                
              ),
            ),
            Tab(
              child: Text(
                "Tâm Lý",
                
              ),
            ),
            Tab(
              child: Text(
                "Hình Sự",
                
              ),
            ),
            Tab(
              child: Text(
                "Thể Thao",
                
              ),
            ),
            Tab(
              child: Text(
                "Bí Ẩn",
                
              ),
            ),
          ],
        ),
      ),
     
      body:const TabBarView(
        children:  [
          TabContent(tabType: "Hành Động"),
          TabContent(tabType: "Phiêu Lưu"),
          TabContent(tabType: "Hài Hước"),
          TabContent(tabType: "Tình Cảm"),
          TabContent(tabType: "Tâm Lý"),
          TabContent(tabType: "Hình Sự"),
          TabContent(tabType: "Thê Thao"),
          TabContent(tabType: "Bí Ẩn"),
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
    cubit.getListMovieByCate(tabType);

    return RefreshIndicator(
      child: BlocBuilder<SortCubit, SortState>(
        builder: (context, state) {
          if (state.loadStatus == LoadStatus.Loading) {
            return const Center(child: SpinKitPouringHourGlassRefined(
              color: Colors.blue,
              size: 50.0,
            ));
          } else if (state.loadStatus == LoadStatus.Error) {
            return const Center(child: Text('Error'));
          } else {
            // Replace with your UI for each tab type
            return const MainSortScreen();
            }
          }
      ),
      onRefresh: () async {
        cubit.getListMovieByCate(tabType);
      },
    );
  }
}
