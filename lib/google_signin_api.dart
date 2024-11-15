import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      print(
          'User Name: ${user.displayName} User Email: ${user.email} User Photo URL: ${user.photoUrl}');
    } else {
      print('Sign-in failed or canceled by user.');
    }
    return user;
  }

  static Future<void> logout() async {
    await _googleSignIn.disconnect();
    print('User signed out.');
  }
}
