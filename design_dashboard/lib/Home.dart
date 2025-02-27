import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/DoctorDashboard.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/HospitalDashboard.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/Head.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/UserDashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if this is the first time the user has entered the application

    // popup dialog

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("SOSAN DASHBOARD")),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 100),
          child: Column(children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Userdashboard()),
                );
              },
              child: Text("Dashboard User"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Doctordashboard()),
                );
              },
              child: Text("Dashboard Doctor"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hospitaldashboard()),
                );
              },
              child: Text("Dashboard Hospital"),
            )
          ]),
        ),
      ),
    );
  }
}
