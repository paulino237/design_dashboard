import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/ConsultationCardHospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/model_appointment_hospital.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConsultationHospital extends StatelessWidget {
  // Map for fetch the data
  List<ConsultationData> doctorConsultations = [
    ConsultationData('Dr. Dupont', 'Cardiologie', 120),
    ConsultationData('Dr. Martin', 'Pédiatrie', 80),
    ConsultationData('Dr. Lefevre', 'Dermatologie', 50),
    ConsultationData('Dr. Moreau', 'Généraliste', 130),
    ConsultationData('Dr. Dubois', 'Radiologie', 20),
    ConsultationData('Dr. Dubois', 'Dentisterie', 190),
    ConsultationData('Dr. Dubois', 'Génicologie', 210),
  ];
  // Map  for fetch the status of consultation
  final data = [
    StatusConsultation('Complete', 75),
    StatusConsultation('Cancel', 150),
    StatusConsultation('Waiting', 275),
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
            "All Consultation",
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
              Linerox("All consultation per Service (Per Day)", () {}),
              SizedBox(
                height: 20,
              ),
              stats3(),
              SizedBox(
                height: 20,
              ),
              Linerox("All consultation on each doctor (Per Service)", () {}),
              SizedBox(
                height: 20,
              ),
              stats2(),
              SizedBox(
                height: 20,
              ),
              Linerox("Status of all consultations", () {}),
              SizedBox(
                height: 20,
              ),
              stats1(),
              SizedBox(
                height: 20,
              ),
              Linerox("All Consultations", () {}),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: modelappointment.length * 70 + 40,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CardAppoitment(
                      modelAppointmentHospital: modelappointment[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: modelappointment.length,
                ),
              ),
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
        RadialBarSeries<StatusConsultation, String>(
          dataSource: data,
          xValueMapper: (StatusConsultation data, _) => data.status,
          yValueMapper: (StatusConsultation data, _) => data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          radius: '100%',
          innerRadius: '50%',
          pointColorMapper: (StatusConsultation data, _) {
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
        BarSeries<ConsultationData, String>(
          dataSource: doctorConsultations,
          xValueMapper: (ConsultationData data, _) => data.doctorName,
          yValueMapper: (ConsultationData data, _) => data.consultations,
          pointColorMapper: (ConsultationData data, _) =>
              _getBarColor(data.consultations),
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  // function for change color of colum in the statistics graphs
  Color _getBarColor(int consultations) {
    if (consultations <= 50) {
      return green; // Si plus de 25 consultations, couleur verte
    } else if (consultations >= 105) {
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
        PieSeries<ConsultationData, String>(
          dataSource: doctorConsultations,
          xValueMapper: (ConsultationData data, _) => data.specialty,
          yValueMapper: (ConsultationData data, _) => data.consultations,
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
class ConsultationData {
  final String doctorName;
  final String specialty;
  final int consultations;

  ConsultationData(this.doctorName, this.specialty, this.consultations);
}

// Model of check the status of the consultation
class StatusConsultation {
  final String status;
  final int count;

  StatusConsultation(this.status, this.count);
}
