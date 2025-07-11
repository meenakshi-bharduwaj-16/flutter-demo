import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthService>();

    return Center(
      child: ElevatedButton(
        onPressed: () {
          auth.logout();
        },
        child: Text("Logout"),
      ),
    );
  }
}