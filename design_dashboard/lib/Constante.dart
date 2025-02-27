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

Row Linerox(String title, Function ontap) {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 18.0),
          child: Text(title,
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 18.0),
        child: InkWell(
          onTap: ontap(),
          child: Icon(
            Icons.more_vert,
            size: 28.0,
            color: Colors.blue,
          ),
        ),
      )
    ],
  );
}

// display this function if composant is not avaible
Future<void> _showNotAvailablePopup(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Feature not available'),
        content: Text('Sorry, this feature is not yet available.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
