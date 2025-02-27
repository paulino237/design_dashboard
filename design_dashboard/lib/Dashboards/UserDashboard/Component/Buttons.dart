import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/consultationUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
              ),
              child: Text(
                'My Détails',
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
              ),
              child: Text(
                'Invite Friends',
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
