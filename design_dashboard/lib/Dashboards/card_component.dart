import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardComponent extends StatelessWidget {
  late String text1;
  late IconData icon;
  late String text2;
  late String text3;
  late Color color;
  late Color iconColor;
  late Color colorText;

  CardComponent({
    super.key,
    required this.text1,
    required this.icon,
    required this.text2,
    required this.text3,
    required this.color,
    required this.colorText,
    required this.iconColor,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: iconColor,
                weight: 32,
              ),
              SizedBox(width: 16),
              Text(
                text1,
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: colorText),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      text2,
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      text3,
                      style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
