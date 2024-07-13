import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _controller = TextEditingController();
  List<String> comments = List.generate(10, (index) => "Bình Luận $index");

  void _addComment(String text) {
    setState(() {
      comments.add(text); // Thêm bình luận mới vào danh sách
      _controller.clear(); // Xóa nội dung trong ô nhập sau khi đã thêm
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:const  CircleAvatar(
                    backgroundImage: AssetImage('assets/venom.jpg'),
                  ),
                  title: Text('User$index'),
                  subtitle: Text(comments[index]),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Bình luận ở đây...',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8), // Thêm padding để định dạng CircleAvatar
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/venom.jpg'), // Thay thế 'assets/user_avatar.png' với đường dẫn của avatar thực tế
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _addComment(_controller.text);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
