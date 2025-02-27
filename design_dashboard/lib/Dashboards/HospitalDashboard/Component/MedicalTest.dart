import 'package:design_dashboard/Constante.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Medicaltest extends StatelessWidget {
  @override
  // Map  for fetch the status of consultation
  final data = [
    StatusTest('Complete', 75),
    StatusTest('Cancel', 150),
    StatusTest('Waiting', 275),
  ];
  List<TestData> doctorConsultations = [
    TestData('Examen de Sel', 120),
    TestData('Examen du Palu', 80),
    TestData('Scanner', 50),
    TestData('Echographie', 130),
    TestData('Radiologie', 20),
    TestData('Massage', 190),
    TestData('Exmane du palu', 210),
  ];
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
            "All Tests",
            style: GoogleFonts.montserrat(
                fontSize: 16.0, fontWeight: FontWeight.w500, color: blue),
          ),
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
                height: 20,
              ),
              // Linerox("All consultation per Service (Per Day)", () {}),
              // SizedBox(
              //   height: 20,
              // ),
              // stats3(),
              SizedBox(
                height: 20,
              ),
              Linerox("All Médical Test", () {}),
              stats2(),
              SizedBox(
                height: 20,
              ),
              Linerox("Status of all test", () {}),
              SizedBox(
                height: 20,
              ),
              stats1(),
              SizedBox(
                height: 20,
              ),
              Linerox("All test", () {}),
              SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: modelappointment.length * 70 + 40,
              //   child: ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return CardAppoitment(
              //         modelAppointmentHospital: modelappointment[index],
              //       );
              //     },
              //     separatorBuilder: (context, index) =>
              //         const SizedBox(width: 10),
              //     itemCount: modelappointment.length,
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }

  SfCircularChart stats1() {
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      series: <CircularSeries>[
        RadialBarSeries<StatusTest, String>(
          dataSource: data,
          xValueMapper: (StatusTest data, _) => data.status,
          yValueMapper: (StatusTest data, _) => data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          radius: '100%',
          innerRadius: '50%',
          pointColorMapper: (StatusTest data, _) {
            if (data.status == 'Cancel') {
              return Colors.red;
            } else if (data.status == 'Complete') {
              return blue;
            } else if (data.status == 'Waiting') {
              return Colors.orange;
            }
          },
        )
      ],
    );
  }

  SfCartesianChart stats2() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: <CartesianSeries>[
        BarSeries<TestData, String>(
          dataSource: doctorConsultations,
          xValueMapper: (TestData data, _) => data.name,
          yValueMapper: (TestData data, _) => data.number,
          pointColorMapper: (TestData data, _) => _getBarColor(data.number),
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  // function for change color of colum in the statistics graphs
  Color _getBarColor(int number) {
    if (number <= 50) {
      return green; // Si plus de 25 number, couleur verte
    } else if (number >= 105) {
      return blue; // Entre 15 et 25 consultations, couleur orange
    } else {
      return Colors.red; // Moins de 15 consultations, couleur rouge
    }
  }

  SfCircularChart stats3() {
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      series: <CircularSeries>[
        PieSeries<TestData, String>(
          dataSource: doctorConsultations,
          xValueMapper: (TestData data, _) => data.name,
          yValueMapper: (TestData data, _) => data.number,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
          ),
        ),
      ],
    );
  }
}

// Model of consultation
class TestData {
  final String name;
  final int number;

  TestData(this.name, this.number);
}

// Model of check the status of the consultation
class StatusTest {
  final String status;
  final int count;

  StatusTest(this.status, this.count);
}
