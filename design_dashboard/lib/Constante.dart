import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// this file existing for send the personnal paramaters to the other files

const blue = Color(0xFF3AB7FC);
const green = Color(0xFF7FD862);

// Appbar constante

PreferredSize app_bar(String text, Function nav) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: nav(),
        ),
        title: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        backgroundColor: green,
      ),
    ),
  );
}
