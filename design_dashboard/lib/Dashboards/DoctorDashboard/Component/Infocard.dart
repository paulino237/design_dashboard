import 'package:design_dashboard/Constante.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class InfoCard extends StatelessWidget {
  late String device;
  late String title;
  late String number;
  IconData icon;

  InfoCard(
      {super.key,
      required this.device,
      required this.number,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              green,
              blue,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  number,
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  device,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  weight: 2,
                  size: 50,
                  icon,
                  color: const Color.fromARGB(255, 59, 59, 59),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
