import 'package:flutter/material.dart';
import 'package:google_signin_no_firebase/google_signin_api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  final GoogleSignInAccount user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    await GoogleSignInApi.logout();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              foregroundImage: widget.user.photoUrl != null
                  ? NetworkImage(widget.user.photoUrl!)
                  : null,
              child: widget.user.photoUrl == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            Text(widget.user.displayName ?? 'Guest User'),
            Text(widget.user.email),
            ElevatedButton(
              onPressed: signOut,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
