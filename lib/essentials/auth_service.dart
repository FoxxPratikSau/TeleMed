import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:tele_med/essentials/user_data.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService extends GetxController {
  final userCredential = Rx<UserCredential?>(null);
  final googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;

  UserData returnUserData() {
    final userData = UserData(
        email: userCredential.value!.user!.email.toString(),
        name: userCredential.value!.user!.displayName.toString(),
        phoneNumber: userCredential.value!.user!.phoneNumber.toString(),
        photoUrl: userCredential.value!.user!.photoURL.toString());
    return userData;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final gCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential.value = await auth.signInWithCredential(gCredential);
      return userCredential.value;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
      // return null;
    }
  }

  signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  // Future<UserCredential?> signUpWithGoogle() async {
  //   // Trigger the Google sign-in flow.
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the Google login.
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;

  //   // Create a new credential.
  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Sign up to Firebase with the credential.
  //   final UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   return userCredential;
}

  // Future<LoginResult> signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   return loginResult;
  // }

