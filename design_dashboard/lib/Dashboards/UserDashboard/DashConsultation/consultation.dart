import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/BarSearch.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/TextItems.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/card.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// this file is a base of dashboard all components that are doing the dashboard are here

class RendezVousGraphique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Données fictives pour l'exemple
    final data = [
      RendezVousData('Waiting', 5),
      RendezVousData('Complete', 20),
      RendezVousData('Cancel', 10),
    ];
    final data1 = [
      SpentData(DateTime(2023, 04, 01), 120.50),
      SpentData(DateTime(2023, 04, 02), 95.75),
      SpentData(DateTime(2023, 04, 03), 150.00),
      SpentData(DateTime(2023, 04, 04), 80.25),
      SpentData(DateTime(2023, 04, 05), 110.00),
      SpentData(DateTime(2023, 04, 06), 135.50),
      SpentData(DateTime(2023, 04, 07), 90.75),
    ];

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
            Search(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 18.0),
                    child: Text("Amount Spent",
                        style: TextStyle(
                            fontSize: 18,
                            color: blue,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  width: 150,
                  height: 30.0,
                  margin: const EdgeInsets.only(left: 7.0, right: 12.0),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 231, 231)
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(13.0)),
                  child: Center(
                      child: Text("300000 XAF",
                          style: TextStyle(
                              fontSize: 15,
                              color: green,
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SfCircularChart(
              title: ChartTitle(
                text: 'Breakdown of appointments',
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                DoughnutSeries<RendezVousData, String>(
                  dataSource: data,
                  xValueMapper: (RendezVousData data, _) => data.status,
                  yValueMapper: (RendezVousData data, _) => data.count,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                  radius: '80%',
                  innerRadius: '60%',
                  pointColorMapper: (RendezVousData data, _) {
                    if (data.status == 'Waiting') {
                      return Colors.orange;
                    } else if (data.status == 'Complete') {
                      return blue;
                    } else {
                      return Colors.red;
                    }
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextItems(
              text1: 'Appointment Completed',
              text2: 'See All',
              color1: blue,
              colortext2: blue,
            ),
            SizedBox(
              height: 10,
            ),
            cardcomplete(),
            SizedBox(
              height: 20,
            ),
            TextItems(
              text1: 'Appointment Wainting',
              text2: 'See All',
              color1: Colors.orange,
              colortext2: Colors.orange,
            ),
            cardwaiting()
          ],
        ),
      ),
    );
  }

  Padding cardwaiting() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildcard(
              colorHere: Colors.deepOrange,
            ),
            SizedBox(
              width: 10,
            ),
            buildcard(
              colorHere: Colors.deepOrange,
            ),
            SizedBox(
              width: 10,
            ),
            buildcard(
              colorHere: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }

  Padding cardcomplete() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildcard(
              colorHere: blue,
            ),
            SizedBox(
              width: 10,
            ),
            buildcard(
              colorHere: blue,
            ),
            SizedBox(
              width: 10,
            ),
            buildcard(
              colorHere: blue,
            )
          ],
        ),
      ),
    );
  }

  // Container CardDoctor() {
  //   return CardDoctor();
  // }
}

class SpentData {
  final DateTime date;
  final double montant;

  SpentData(this.date, this.montant);
}

class RendezVousData {
  final String status;
  final int count;

  RendezVousData(this.status, this.count);
}
