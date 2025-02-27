import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/balance.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultation.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/Buttons.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/Head.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/consultationUser.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashTest/test.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/UserDashboard.dart';
import 'package:design_dashboard/Dashboards/card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Doctordashboard extends StatelessWidget {
  final Map<String, String> dataMap = {
    'Language': '',
    'Notification': '',
    'Medical Profile': '',
    'Payment Profile': '',
    'Change Password': '',
    'Delete Account': '',
  };
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Head(),
            SizedBox(
              height: 20,
            ),
            Buttons(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      child: CardComponent(
                        text1: "300000 ",
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
                          MaterialPageRoute(builder: (context) => Balance()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: CardComponent(
                        text1: "300",
                        icon: Icons.person,
                        color: green,
                        text3: "Appointment Statistics",
                        colorText: blue,
                        text2: ' Consultation',
                        iconColor: green,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsultationDoctor()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => Test()),
                    //     );
                    //   },
                    //   child: CardComponent(
                    //     text1: "100",
                    //     icon: LineAwesomeIcons.book_medical_solid,
                    //     color: blue,
                    //     text3: "All Test Appointment",
                    //     colorText: green,
                    //     text2: 'Medical Tests',
                    //     iconColor: blue,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
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
