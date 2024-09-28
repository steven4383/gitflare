import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginContoller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString githubAccessToken = ''.obs;

  Future<bool> signInWithGitHub() async {
    try {
      final githubProvider = GithubAuthProvider();
      githubProvider.addScope('repo');
      githubProvider.addScope('read:org');
      githubProvider.addScope('user');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final UserCredential userCredential = await auth.signInWithProvider(githubProvider);
      // print('Scopes: ${githubProvider.scopes}');
      githubAccessToken.value = userCredential.credential!.accessToken!;
      await prefs.setString('githubAccessToken', userCredential.credential?.accessToken ?? "");

      return true;
    } catch (e) {
      log('Error during GitHub sign-in: $e');
      return false;
    }
  }
}
