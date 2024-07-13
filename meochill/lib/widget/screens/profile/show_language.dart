// language_dialog.dart


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/main_cubit.dart';


void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Chọn ngôn ngữ'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    ListTile(
                        title: const Text('Tiếng Anh'),
                        onTap: () {
                          context.read<MainCubit>().changeLanguage('en', 'US'); // Thay đổi ngôn ngữ sang Tiếng Anh
                          Navigator.pop(context);
                        }),
                    ListTile(
                        title: const Text('Tiếng Việt'),
                        onTap: () {
                          context.read<MainCubit>().changeLanguage('vi', 'VN'); // Thay đổi ngôn ngữ sang Tiếng Việt
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Hủy'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],  
        );
      },
    );
}