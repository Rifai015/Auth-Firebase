import 'package:auth_firebase/halaman_wisata.dart';
import 'package:auth_firebase/models/wisata_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWisata extends StatelessWidget {
  final WisataModels wisata;
  const CardWisata({
    super.key,
    required this.wisata,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanWisata(
            wisata: wisata,
          ),
        ),
      ),
      child: Container(
        width: 200,
        height: 300,
        margin: const EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    wisata.image!,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.title!,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // Text(
                  //   "Addres",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.black,
                  //     fontSize: 12,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
