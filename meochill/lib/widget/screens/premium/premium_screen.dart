import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meochill/generated/l10n.dart';
import 'package:meochill/widget/screens/premium/cubit/premium_cubit.dart';
import 'package:meochill/widget/screens/premium/premiumdetails_screen.dart';

import '../../../repostsitories/api.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PremiumCubit(context.read<Api>()),
      child: PillowList(),
    );
  }
}

class PillowList extends StatelessWidget {
  final List<Pillow> pillows = [
    Pillow(
        name: 'Gối Siêu Nâng Cấp',
        price: '300.000 VND',
        description: 'Gối trải nghiệm full tính năng của App',
        icon: CupertinoIcons.star),
    Pillow(
        name: 'Gối Cải Thiện Chức Năng',
        price: '200.000 VND',
        description: 'Gối giúp bạn xem phim mượt mà hơn',
        icon: CupertinoIcons.arrow_up),
    Pillow(
        name: 'Gối Nâng Cao',
        price: '100.000 VND',
        description: 'Gối mở các phim đã bị khóa',
        icon: CupertinoIcons.lock_open),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color for the entire scaffold
      appBar: AppBar(
        title: Text('Mua Premium'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Chọn gói thành viên phù hợp với bạn",
              style: TextStyle(
                fontSize: 24, // Increased font size
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              softWrap: true, // Allows text wrapping
            ),
          ),
          Expanded(
            // Make ListView take the remaining space
            child: ListView.builder(
              itemCount: pillows.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850], // Dark card background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(pillows[index].icon, size: 40, color: Colors.blue),
                        SizedBox(height: 8),
                        Text(
                          pillows[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White text for dark theme
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          pillows[index].price,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70), // Slightly greyed text
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pillows[index].description,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        CupertinoButton(
                          color: Colors
                              .blue, // Blue button for a more standard look
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SubscriptionPage()));

                            // Logic to handle subscription or any action
                          },
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Pillow {
  final String name;
  final String price;
  final String description;
  final IconData icon;

  Pillow(
      {required this.name,
      required this.price,
      required this.description,
      required this.icon});
}
