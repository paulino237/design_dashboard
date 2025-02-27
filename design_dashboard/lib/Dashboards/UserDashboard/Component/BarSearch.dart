import 'package:design_dashboard/Constante.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 7.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 239, 239),
                  borderRadius: BorderRadius.circular(40.0)),
              child: TextFormField(
                cursorColor: green,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      size: 25.0,
                      color: green,
                    ),
                    border: InputBorder.none,
                    hintText: "Enter your search",
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.5))),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50.0,
              height: 50.0,
              margin: const EdgeInsets.only(left: 7.0, right: 12.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 239, 239),
                  borderRadius: BorderRadius.circular(13.0)),
              child: Icon(
                LineAwesomeIcons.sliders_h_solid,
                color: blue,
                size: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RendezVousData {
  final String status;
  final int count;

  RendezVousData(this.status, this.count);
}
