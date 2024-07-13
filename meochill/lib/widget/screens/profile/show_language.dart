// language_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/main_cubit.dart';

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => MainCubit(),
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return AlertDialog(
              title: Text('Chọn ngôn ngữ'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    ListTile(
                        title: Text('Tiếng Anh'),
                        onTap: () => Navigator.pop(context)),
                    ListTile(
                        title: Text('Tiếng Việt'),
                        onTap: () => Navigator.pop(context)),
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
        ),
      );
    },
  );
}
