import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/common/enum/category_item.dart';
import 'package:meochill/common/enum/load_status.dart';
import 'package:meochill/repostsitories/api.dart';
import 'package:meochill/widget/screens/search/cubit/search_cubit.dart';
import 'package:meochill/widget/screens/search/cubit/search_state.dart';
import 'package:meochill/widget/screens/search/widget/search_ideal.dart';
import 'package:meochill/widget/screens/search/widget/search_result.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_cubit.dart';
import 'package:meochill/widget/screens/sort/cubit/sort_state.dart';
import 'package:meochill/widget/screens/sort/widget/main_sort_screen.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortCubit(context.read<Api>()),
      child: BlocConsumer<SortCubit, SortState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Main();
        },
      ),
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
                  "Hanh Dong",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Hanh dong",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Hài Kịch",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           
            BlocBuilder<SortCubit, SortState>(
              builder: (context, state) {
                
                if (state.loadStatus == LoadStatus.Loading) {
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state.loadStatus == LoadStatus.Error){
                  
                 return Center(child: Text("null"),);
                }else{
                  return MainSortScreen();
                }
              },
            ),
            HanhDong(),
            Center(child:Text("null")),
            Center(child: Text("null")),
          ],
        ),
      ),
    );
  }

class HanhDong extends StatelessWidget {
  const HanhDong({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      BlocProvider.of<SortCubit>(context).getTypehanhdong();
    });
    return RefreshIndicator(child: BlocBuilder<SortCubit, SortState>(
      builder: (context, state) {
        if(state.loadStatus==LoadStatus.Loading){
           return Center(child: const CircularProgressIndicator());
        }
        else if(state.loadStatus==LoadStatus.Error){
          return Center(child: Text('null'));
        }
        else{
          return MainSortScreen();
        }
      },

    ), onRefresh: ()async {
      BlocProvider.of<SortCubit>(context).getTypehanhdong();
    });
 
  }
  }
  class HoatHinh extends StatelessWidget {
  const HoatHinh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      BlocProvider.of<SortCubit>(context).getTypeMovie();
    });
    return RefreshIndicator(child: BlocBuilder<SortCubit, SortState>(
      builder: (context, state) {
        if(state.loadStatus==LoadStatus.Loading){
           return Center(child: const CircularProgressIndicator());
        }
        else if(state.loadStatus==LoadStatus.Error){
          return Center(child: Text('null'));
        }
        else{
          return MainSortScreen();
        }
      },

    ), onRefresh: ()async {
      BlocProvider.of<SortCubit>(context).getTypeMovie();
    });
 
  }
}
