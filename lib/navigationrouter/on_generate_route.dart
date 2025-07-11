import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Home")),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/profile',
            arguments: {'userId': 42},
          );
        },
        child: Text("Go to Profile"),
      ),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  final int userId;

  const ProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Profile")),
    body: Center(child: Text("User ID: $userId")),
  );
}