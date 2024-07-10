// language_dialog.dart
import 'package:flutter/material.dart';

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Chọn ngôn ngữ'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(title: Text('Tiếng Anh'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Việt'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Nhật'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Pháp'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Đức'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Tây Ban Nha'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Bồ Đào Nha'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Ý'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Hàn'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Nga'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Ả Rập'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Thổ Nhĩ Kỳ'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Trung Quốc Giản Thể'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Trung Quốc Phồn Thể'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Hindi'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Thái'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Indonesia'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Malaysia'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Do Thái'), onTap: () => Navigator.pop(context)),
              ListTile(title: Text('Tiếng Ukraina'), onTap: () => Navigator.pop(context)),
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
