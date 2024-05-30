import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('View Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${user?.email}'),
            // Add more profile information here
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
