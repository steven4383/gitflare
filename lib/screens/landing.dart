import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/screens/home_screen.dart';
import 'package:gitflare/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String? token;

  checkAuthStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('githubAccessToken');
    });
    final LoginContoller loginContoller = Get.find<LoginContoller>();
    loginContoller.githubAccessToken.value = token ?? '';
    // print(loginContoller.githubAccessToken.value);
  }

  @override
  void initState() {
    checkAuthStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (token == null || token == "" || token!.isEmpty) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}
