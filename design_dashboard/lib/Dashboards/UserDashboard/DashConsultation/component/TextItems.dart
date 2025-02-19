import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextItems extends StatelessWidget {
  String text1;
  String text2;
  Color color1;
  Color colortext2;
  TextItems({
    required this.text1,
    required this.text2,
    required this.color1,
    required this.colortext2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 18.0),
            child: Text(text1,
                style: GoogleFonts.montserrat(
                    fontSize: 18, color: color1, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 18.0),
          child: InkWell(
            onTap: () {},
            child: Text(
              text2,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, color: colortext2),
            ),
          ),
        )
      ],
    );
  }
}
