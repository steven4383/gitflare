import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:gitflare/controller/login_contoller.dart';
import 'package:gitflare/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginContoller loginContoller = Get.find<LoginContoller>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 203, child: Image.asset("assets/images/github.png")),
                SizedBox(width: 240, child: Image.asset("assets/images/monitor.png")),
                const Column(
                  children: [
                    Text(
                      "Let Built from here...",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Gap(5),
                    Text(
                      "Our platform drives innovation with tools that boost developer velocity",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Color(0xff5F607E)),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await loginContoller.signInWithGitHub().then((success) {
                      if (success) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('GitHub signIn failed'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('An unexpected error occurred: $error'),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xff706CFF),
                      ),
                      child: const Center(
                          child: Text("Sign in with Github", style: TextStyle(fontSize: 15, color: Colors.white)))),
                ),
              ],
            ),
          ),
        ));
  }
}
