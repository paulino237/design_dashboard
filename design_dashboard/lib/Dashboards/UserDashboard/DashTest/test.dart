import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/BarSearch.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/TextItems.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/component/card.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashTest/component/card_test.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// this file is a base of dashboard all components that are doing the dashboard are here

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Données fictives pour l'exemple
    final data = [
      TestData('Waiting', 5),
      TestData('Complete', 20),
      TestData('Cancel', 10),
    ];
    final data1 = [
      SpentData("Mo", 20.1),
      SpentData("Tu", 10.1),
      SpentData("We", 20.1),
      SpentData("Th", 48.1),
      SpentData("Fri", 150.1),
      SpentData("Sa", 10.1),
      SpentData("Su", 20.1),
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
            title: Center(
              child: Text(
                "Statistics Test",
                style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
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
                      child: Text("Total Spend",
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
                        child: Text("150000 XAF",
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
                  text: 'Breakdown of medical tests',
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
                  DoughnutSeries<TestData, String>(
                    dataSource: data,
                    xValueMapper: (TestData data, _) => data.status,
                    yValueMapper: (TestData data, _) => data.count,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                    radius: '80%',
                    innerRadius: '60%',
                    pointColorMapper: (TestData data, _) {
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
                text1: 'Medicals Tests Completed',
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
                text1: 'Medicals Tests Wainting',
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
            buildcardTest(
              colorHere: Colors.deepOrange,
            ),
            SizedBox(
              width: 10,
            ),
            buildcardTest(
              colorHere: Colors.deepOrange,
            ),
            SizedBox(
              width: 10,
            ),
            buildcardTest(
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
            buildcardTest(
              colorHere: blue,
            ),
            SizedBox(
              width: 10,
            ),
            buildcardTest(
              colorHere: blue,
            ),
            SizedBox(
              width: 10,
            ),
            buildcardTest(
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

class TestData {
  final String status;
  final int count;

  TestData(this.status, this.count);
}
