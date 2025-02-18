import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/Buttons.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/Head.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/consultation.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Userdashboard extends StatelessWidget {
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
                    CardComponent(
                      text1: "3000 XAF",
                      icon: LineAwesomeIcons.wallet_solid,
                      color: blue,
                      text3: "Expenses",
                      colorText: green,
                      text2: 'Amount Spent',
                      iconColor: blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: CardComponent(
                        text1: "300",
                        icon: Icons.person,
                        color: green,
                        text3: "All Doctor appointment",
                        colorText: blue,
                        text2: ' Consultation',
                        iconColor: green,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RendezVousGraphique()),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: CardComponent(
                        text1: "100",
                        icon: LineAwesomeIcons.book_medical_solid,
                        color: blue,
                        text3: "All Test Appointment",
                        colorText: green,
                        text2: 'Medical Tests',
                        iconColor: blue,
                      ),
                    ),
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
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

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
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      text3,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
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
