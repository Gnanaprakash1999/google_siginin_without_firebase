import 'package:flutter/material.dart';
import 'package:google_signin_no_firebase/google_signin_api.dart';
import 'package:google_signin_no_firebase/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> signIn() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-in failed")),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage(user: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Firebase"),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Using google cloud OAuth login"),
              const SizedBox(
                height: 30,
              ),
              FilledButton.tonalIcon(
                onPressed: signIn,
                icon: const Icon(Icons.login_rounded),
                label: const Text("Continue with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
