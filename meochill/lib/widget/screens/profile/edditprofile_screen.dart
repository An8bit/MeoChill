import 'package:flutter/material.dart';
import 'package:meochill/widget/screens/profile/setting_screen.dart';

class EdditprofileScreen extends StatelessWidget {
  const EdditprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red, // Red theme for overall primary elements
      ),
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = "Nguyen Thanh An";
    emailController.text = "thanh.an@gmail.com";
    phoneController.text = "+84981234567";
    passwordController.text = "yourpassword";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            buildTextField("Username", usernameController),
            SizedBox(height: 16),
            buildTextField("Email", emailController),
            SizedBox(height: 16),
            buildTextField("Phone Number", phoneController),
            SizedBox(height: 16),
            buildTextField("Password", passwordController, isPassword: true),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: Text('Cập nhật', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set button color to red
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)), // Fully rounded corners
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      obscureText: isPassword,
    );
  }
}
