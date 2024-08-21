import 'dart:async';

import 'package:auth_firebase/button-navigation/halaman_bottom.dart';
import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        } else {
          context.read<AuthCubit>().dataId(
                user.uid,
              );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HalamanBottom(),
            ),
            (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/gambar.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
