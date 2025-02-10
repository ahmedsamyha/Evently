import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/view/aouth/screens/login_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                FirebaseManager.logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (route) => false,
                );
              },
              child: Text('Logout')),
        ],
      ),
    );
  }
}
