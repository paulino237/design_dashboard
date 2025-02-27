import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/Infocard.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultationCard.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultation_model.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/model_transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConsultationDoctor extends StatelessWidget {
  final data = [
    RendezVousData('Waiting', 5),
    RendezVousData('Complete', 20),
    RendezVousData('Cancel', 10),
  ];
  @override
  Widget build(BuildContext context) {
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
              "All Consultation",
              style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            backgroundColor: green,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoCard(
                  device: "",
                  number: "4500",
                  icon: LineAwesomeIcons.user,
                  title: "Number of Consultation"),
              SizedBox(
                height: 20,
              ),
              Linerox("Consultation Statistics", () {}),
              SizedBox(
                height: 20,
              ),
              Center(
                child: stats(),
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
              Linerox("All Consultations", () {}),
              SizedBox(
                height: 20,
              ),
              // composant using for display each items for the consultation
              SizedBox(
                width: double.infinity,
                height: consultationList.length * 70 + 40,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Consultationcard(
                      consultation: consultationList[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: consultationList.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row line using for thr organisation of the screen
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

// this is composant using for fetch the statistics of consultation
SfCartesianChart stats() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(
      title: AxisTitle(text: 'Days'),
    ),
    series: <CartesianSeries>[
      StepLineSeries<DailyConsultation, String>(
        animationDelay: 10,
        dataSource: [
          DailyConsultation('Mo', 150.0),
          DailyConsultation('Tu', 80.0),
          DailyConsultation('We', 210.0),
          DailyConsultation('Th', 190.0),
          DailyConsultation('Fri', 20.0),
          DailyConsultation('Sa', 250.0),
          DailyConsultation('Su', 300.0),
        ],
        xValueMapper: (DailyConsultation data, _) => data.day,
        yValueMapper: (DailyConsultation data, _) => data.numberConsultation,
        pointColorMapper: (DailyConsultation data, _) {
          if (data.day == 'Mo') {
            return blue;
          } else if (data.day == 'Tu') {
            return green;
          } else if (data.day == 'We') {
            return const Color.fromARGB(255, 236, 59, 5);
          } else if (data.day == 'Th') {
            return const Color.fromARGB(255, 36, 24, 145);
          } else if (data.day == 'Fri') {
            return const Color.fromARGB(255, 187, 83, 76);
          } else if (data.day == 'Sa') {
            return Colors.black;
          } else {
            return const Color.fromARGB(255, 96, 116, 10);
          }
        },
      ),
    ],
  );
}

class DailyConsultation {
  DailyConsultation(this.day, this.numberConsultation);
  final String day;
  final double numberConsultation;
}

class RendezVousData {
  final String status;
  final int count;

  RendezVousData(this.status, this.count);
}
