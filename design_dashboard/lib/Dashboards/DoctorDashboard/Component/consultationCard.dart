import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultation_model.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/model_transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'model_transaction.dart';

class Consultationcard extends StatelessWidget {
  late Consultation consultation;
  Consultationcard({
    super.key,
    required this.consultation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 8,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/img/${consultation.imageName}",
                ),
              ),
            ),

            // const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consultation.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 75.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 239, 239),
                        borderRadius: BorderRadius.circular(13.0)),
                    child: Center(
                      child: Text(
                        consultation.status,
                        style: GoogleFonts.montserrat(
                          color: consultation.status == "Waiting"
                              ? Colors.orange
                              : consultation.status == "Complete"
                                  ? blue
                                  : Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        DateFormat('EEEE, d MMMM').format(consultation.date),
                        style: GoogleFonts.montserrat(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
