import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // Begin
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // Obtain Detail
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    // Create New Credential
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    // Sign In
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
