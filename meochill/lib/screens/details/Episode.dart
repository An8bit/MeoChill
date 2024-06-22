import 'package:flutter/material.dart';

class EpisodeGrid extends StatelessWidget {
  const EpisodeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170, // Thiết lập chiều cao cho GridView
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Số cột
          childAspectRatio: 2.0, // Tỷ lệ khung hình của mỗi ô
          mainAxisSpacing: 10, // Khoảng cách chính giữa các ô
          crossAxisSpacing: 10, // Khoảng cách phụ giữa các ô
        ),
        itemCount: 54, // Số lượng tập từ 1 đến 12
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(
              child: Text('Tập ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}