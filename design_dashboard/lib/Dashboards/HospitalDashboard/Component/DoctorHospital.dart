import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/cardDoctor.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/Component/BarSearch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Doctorhospital extends StatelessWidget {
  final data = [
    StatusDoctor('Inactive', 75),
    StatusDoctor('Active', 150),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "All Doctors",
          style: GoogleFonts.montserrat(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: blue),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Search(),
              SizedBox(
                height: 20,
              ),
              stats1(),
              SizedBox(
                height: 20,
              ),
              Linerox("All Doctors", () {}),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardDoctor(
                        name: 'Sosan',
                        speciality: 'Cardiologiste',
                        status: 'Active',
                        image: 'téléchargement (1).jpg',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardDoctor(
                        name: 'Daniel',
                        speciality: 'Generaliste',
                        status: 'Inactive',
                        image: 'téléchargement (3).jpg',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardDoctor(
                        name: 'Raoul',
                        speciality: 'Oncologie',
                        status: 'Active',
                        image: 'téléchargement (2).jpg',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SfCircularChart stats1() {
    return SfCircularChart(
      title: ChartTitle(
        text: 'Activity of doctors',
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
        RadialBarSeries<StatusDoctor, String>(
          dataSource: data,
          xValueMapper: (StatusDoctor data, _) => data.status,
          yValueMapper: (StatusDoctor data, _) => data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          radius: '80%',
          innerRadius: '60%',
          pointColorMapper: (StatusDoctor data, _) {
            if (data.status == 'Inactive') {
              return Colors.red;
            } else if (data.status == 'Active') {
              return blue;
            }
          },
        )
      ],
    );
  }
}

class StatusDoctor {
  final String status;
  final int count;

  StatusDoctor(this.status, this.count);
}
