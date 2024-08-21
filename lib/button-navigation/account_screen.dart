import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_firebase/cubit/wisata_cubit/wisata_cubit.dart';
import 'package:auth_firebase/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    context.read<WisataCubit>().getWisata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/gambar6.JPG",
                    ),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nama : ",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return Text(
                        state.user.name!,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jurusan : ",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return Text(
                        state.user.jurusan!,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Email : ",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return Text(
                        state.user.email!,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(
                  250,
                  45,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                "Sign out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
