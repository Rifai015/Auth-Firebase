import 'package:auth_firebase/models/wisata_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanWisata extends StatefulWidget {
  final WisataModels wisata;
  const HalamanWisata({
    super.key,
    required this.wisata,
  });

  @override
  State<HalamanWisata> createState() => _HalamanWisataState();
}

class _HalamanWisataState extends State<HalamanWisata> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            images(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget images() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.wisata.image!,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(
            15,
          ),
          bottomRight: Radius.circular(
            15,
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 45,
          ),
          Text(
            widget.wisata.title!,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Deskripsi",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.wisata.deskripsi!,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
