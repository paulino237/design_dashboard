import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/BarSearch.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/TextItems.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/card.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// this file is a base of dashboard all components that are doing the dashboard are here

class RendezVousGraphique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fictif data  for test
    final data = [
      RendezVousData('Waiting', 5),
      RendezVousData('Complete', 20),
      RendezVousData('Cancel', 10),
    ];
    final data1 = [
      SpentData("Mo", 3000),
      SpentData("Tu", 1000),
      SpentData("We", 2500),
      SpentData("Th", 4120),
      SpentData("Fri", 2150),
      SpentData("Sa", 10),
      SpentData("Su", 150),
    ];
    void goBack(BuildContext context) {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              "Statistics Consultations",
              style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: green,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
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
                      child: Text("Total Spent",
                          style: GoogleFonts.montserrat(
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
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: green,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SfCartesianChart(
                title: ChartTitle(
                  text: 'Weekly Spending',
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                      text: 'Days',
                      textStyle: GoogleFonts.montserrat(
                          color: blue, fontWeight: FontWeight.w600)),
                ),
                primaryYAxis: NumericAxis(
                  numberFormat:
                      NumberFormat.currency(locale: 'fr_FR', symbol: 'Xaf'),
                ),
                series: <CartesianSeries>[
                  BarSeries<SpentData, String>(
                    dataSource: data1,
                    xValueMapper: (SpentData data, _) => data.jour,
                    yValueMapper: (SpentData data, _) => data.montant,
                    pointColorMapper: (SpentData data, _) {
                      if (data.jour == 'Mo') {
                        return blue;
                      } else if (data.jour == 'Tu') {
                        return green;
                      } else if (data.jour == 'We') {
                        return Colors.yellow;
                      } else if (data.jour == 'Th') {
                        return Colors.orange;
                      } else if (data.jour == 'Fri') {
                        return Colors.red;
                      } else if (data.jour == 'Sa') {
                        return Colors.purple;
                      } else {
                        return Colors.pink;
                      }
                    },
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ],
                isTransposed: true,
              ),
              SizedBox(
                height: 20,
              ),
              SfCircularChart(
                title: ChartTitle(
                  text: 'Breakdown of appointments',
                  textStyle: GoogleFonts.montserrat(
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
  final String jour;
  final double montant;

  SpentData(this.jour, this.montant);
}

class RendezVousData {
  final String status;
  final int count;

  RendezVousData(this.status, this.count);
}
