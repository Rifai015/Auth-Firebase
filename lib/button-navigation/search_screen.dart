import 'package:auth_firebase/widget/card_wisata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/wisata_cubit/wisata_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    txtSearch.addListener(
      onChange,
    );
    super.initState();
  }

  @override
  void dispose() {
    txtSearch.removeListener(
      onChange,
    );
    txtSearch.dispose();
    super.dispose();
  }

  void onChange() {
    context.read<WisataCubit>().fillterWisata(
          txtSearch.text,
        );
  }

  final TextEditingController txtSearch = TextEditingController(
    text: "",
  );
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
    return TextField(
      controller: txtSearch,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintText: "Cari Wisata Destinasimu...",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.all(
          12,
        ),
      ),
      keyboardType: TextInputType.text,
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
          "Wisata Saya",
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
        ),
      ],
    );
  }
}
