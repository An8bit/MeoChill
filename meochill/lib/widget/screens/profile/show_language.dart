// language_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/widget/screens/profile/cubit/profile_cubit.dart';

import '../../../repostsitories/api.dart';
import 'cubit/profile_state.dart';

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => ProfileCubit(context.read<Api>()),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return AlertDialog(
              title: const Text('Chọn ngôn ngữ'),
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
