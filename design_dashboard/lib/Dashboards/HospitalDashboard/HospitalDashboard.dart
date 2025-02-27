import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/balance.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultation.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/ConsultationHospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/DoctorHospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/MedicalTest.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/balance_hospital.dart';
import 'package:design_dashboard/Dashboards/card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Hospitaldashboard extends StatelessWidget {
  final Map<String, String> dataMap = {
    'Language': '',
    'Notification': '',
    'Payment Profile': '',
    'Change Password': '',
    'Delete Account': '',
    'Logout': '',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          tooltip: "Add",
          onPressed: () {},
          backgroundColor: blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Center(
              child: ProfilPic(),
            ),
            SizedBox(
              height: 30,
            ),
            cardStats(context),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final keys = dataMap.keys.toList();
                final item = dataMap[keys[index]];

                return ListItems(keys[index]);
              },
              itemCount: dataMap.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile ListItems(String text) {
    return ListTile(
      onTap: () {},
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineAwesomeIcons.angle_right_solid,
            color: Colors.black,
          )),
      title: Text(
        text,
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}

Column cardStats(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: CardComponent(
              text1: "3.000.000 ",
              icon: LineAwesomeIcons.wallet_solid,
              color: blue,
              text3: "Total amount won",
              colorText: green,
              text2: 'Balance',
              iconColor: blue,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BalanceHospital()),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: CardComponent(
              text1: "300",
              icon: LineAwesomeIcons.stethoscope_solid,
              color: green,
              text3: "Appointment Statistics",
              colorText: blue,
              text2: ' Consultation',
              iconColor: green,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConsultationHospital()),
              );
            },
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: CardComponent(
              text1: "1.200",
              icon: LineAwesomeIcons.notes_medical_solid,
              color: green,
              text3: "Test Statistics",
              colorText: blue,
              text2: ' Medical Test',
              iconColor: green,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Medicaltest()),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: CardComponent(
              text1: "100 ",
              icon: LineAwesomeIcons.user,
              color: blue,
              text3: "Number of doctors",
              colorText: green,
              text2: 'Doctors',
              iconColor: blue,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Doctorhospital()),
              );
            },
          ),
        ],
      ),
    ],
  );
}

Container ProfilPic() {
  return Container(
    height: 150,
    width: 150,
    child: Stack(
      children: [
        // Le rond
        CircleAvatar(
          radius: 125,
          backgroundImage: AssetImage('assets/img/téléchargement (3).jpg'),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              heightFactor: 15,
              widthFactor: 15,
              child: Icon(
                LineAwesomeIcons.camera_retro_solid,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
