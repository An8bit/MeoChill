import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Profile',
      theme: ThemeData(
        brightness: Brightness.dark, // Enable dark mode
        primarySwatch: Colors.red,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/venom.jpg'), // Replace with your image URL
                ),
                 SizedBox(height: 20),
                Text('User 1', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text('Chỉnh sửa profile'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red, disabledForegroundColor: Colors.white.withOpacity(0.38),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Thông tin tài khoản'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Tài khoảng liên kết'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Quản lý thiết bị'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Phim yêu thích'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Download'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Ngôn ngữ'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: Text('Download Khi có wifi Wifi'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {},
            ),
          ),
        ],
      ),
    );
  }
}