import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class buildcardTest extends StatelessWidget {
  Color colorHere;
  buildcardTest({
    required this.colorHere,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ra,",
                  style: GoogleFonts.montserrat(
                      color: colorHere,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Radiologie",
                  style: GoogleFonts.montserrat(
                      color: colorHere,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/img/1.png',
                    width: 68,
                    height: 68,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hospital SOSAN',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xff0D1B34),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(15),
            const Divider(
              color: Color(0xffF5F5F5),
              height: 1,
              thickness: 1,
            ),
            const Gap(15),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        LineAwesomeIcons.calendar,
                        color: colorHere,
                      ),
                      const Gap(8),
                      Text(
                        DateFormat('EEEE, d MMMM')
                            .format(DateTime(2024, 06, 12)),
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: const Color(0xff8696BB),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        LineAwesomeIcons.clock,
                        color: colorHere,
                      ),
                      const Gap(8),
                      Text(
                        '11:00 - 12:00 AM',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: const Color(0xff8696BB),
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    colorHere.withOpacity(0.1),
                  ),
                ),
                child: Text(
                  'Details',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: colorHere,
                    height: 1,
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
