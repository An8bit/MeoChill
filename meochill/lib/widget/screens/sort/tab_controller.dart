import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';
import 'package:meochill/widget/screens/sort/widget/main_sort_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../generated/l10n.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortCubit(context.read<Api>()),
      child: Main(context),
    );
  }
}

DefaultTabController Main(BuildContext context) {


  return DefaultTabController(
    length: 8,
   
    child: Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).titleCategoryList),
        bottom:  TabBar(
          isScrollable: true,
          tabs: [
             Tab(
              child: Text(
                S.of(context).titleFlim1,
               
              ),
            ),
             Tab(
              child: Text(
                S.of(context).titleFlim2,
                
              ),
            ),
             Tab(
              child: Text(
                S.of(context).titleFlim3,
                
              ),
            ),
             Tab(
              child: Text(
                S.of(context).tiltleFlim4,
                
              ),
            ),
            Tab(
              child: Text(
                S.of(context).titleFlim5,
                
              ),
            ),
            Tab(
              child: Text(
               S.of(context).titleFlim6,
                
              ),
            ),
            Tab(
              child: Text(
                S.of(context).titleFlim7,
                
              ),
            ),
            Tab(
              child: Text(
                S.of(context).titleFlim8,
                
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
