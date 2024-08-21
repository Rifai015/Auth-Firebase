import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_firebase/cubit/wisata_cubit/wisata_cubit.dart';
import 'package:auth_firebase/firebase_options.dart';
import 'package:auth_firebase/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MainActivity(),
  );
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => WisataCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
