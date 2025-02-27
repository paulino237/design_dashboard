import 'package:design_dashboard/Constante.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDoctor extends StatelessWidget {
  late String name;
  late String speciality;
  late String status;
  late String image;
  CardDoctor(
      {required this.name,
      required this.speciality,
      required this.status,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
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
              children: [
                Spacer(),
                Container(
                  width: 75.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 239, 239),
                      borderRadius: BorderRadius.circular(13.0)),
                  child: Center(
                    child: Text(
                      status,
                      style: GoogleFonts.montserrat(
                        color: speciality == "Inactive" ? Colors.red : green,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/img/$image",
                    ),
                  ),
                ),
                // ClipOval(
                //   child: Image.asset(
                //     'assets/img/$image',
                //     width: 78,
                //     height: 78,
                //   ),
                // ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr $name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color(0xff0D1B34),
                          height: 1,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        speciality,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
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
                    Colors.grey.withOpacity(0.1),
                  ),
                ),
                child: Text(
                  'Details',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: blue,
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
