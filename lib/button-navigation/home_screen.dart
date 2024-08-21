import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:auth_firebase/cubit/wisata_cubit/wisata_cubit.dart';
import 'package:auth_firebase/widget/card_wisata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<WisataCubit>().getWisata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(
          20,
        ),
        children: [
          header(),
          body(),
        ],
      ),
    );
  }

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hello",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.user.name!,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                width: 75,
                height: 75,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/gambar6.JPG",
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        Text(
          "Wisata Saya ",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<WisataCubit, WisataState>(
          builder: (context, state) {
            if (state is WisataSucces) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.wisata.map((wisata) {
                    return CardWisata(
                      wisata: wisata,
                    );
                  }).toList(),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
