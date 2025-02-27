import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/BarSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Infodoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Search(),
              SizedBox(
                height: 10,
              ),
              infos(),
              infos(),
              infos(),
            ],
          ),
        ),
      ),
    );
  }

  Padding infos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 280,
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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image du docteur (photo)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        50), // Coins arrondis pour la photo
                    child: Image.asset(
                      'assets/img/1.png', // Assurez-vous d'ajouter une photo à ce chemin
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: green, // Couleur verte pour le point
                        shape: BoxShape.circle, // Forme circulaire
                        border: Border.all(
                            color: Colors.white,
                            width: 3), // Bordure blanche autour
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Informations du docteur
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Daniel Doe',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Cardiologue',
                          style:
                              GoogleFonts.montserrat(fontSize: 16, color: blue),
                        ),
                        Text(
                          'Ordre N:12345',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: BorderRadius.circular(13.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('4.5',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white, fontSize: 16)),
                                    Spacer(),
                                    // Nombre d'étoiles
                                    Icon(Icons.star,
                                        color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            // Nombre d'avis
                            Text('120 reviews',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.favorite,
                    color: blue,
                    size: 25.0,
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Divider(
                color: blue,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Text(
                    '3 Yrs',
                    style: GoogleFonts.montserrat(fontSize: 16, color: blue),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Experience',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    '+' + '500',
                    style: GoogleFonts.montserrat(fontSize: 16, color: blue),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Consultations',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Langues Parlées :',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Francais, ' + ' Espagnol',
                    style: GoogleFonts.montserrat(fontSize: 16, color: blue),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 300,
                  //padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        green,
                        blue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    // border: Border(
                    //   top: BorderSide(color: Colors.grey[600]!, width: 1.0),
                    //   bottom: BorderSide(color: Colors.grey[600]!, width: 1.0),
                    // ),
                  ),
                  child: Center(
                    child: Text(
                      "Take Appointment",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
