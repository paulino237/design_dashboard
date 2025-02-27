import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/Infocard.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/balance.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/model_transaction.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/transactionCard.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/consultationUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BalanceHospital extends StatefulWidget {
  @override
  State<BalanceHospital> createState() => _BalanceHospitalState();
}

class _BalanceHospitalState extends State<BalanceHospital> {
  // this list are using for fetch items in the database
  final data1 = [
    DailyConsultationRevenue("Mo", 300000),
    DailyConsultationRevenue("Tu", 100000),
    DailyConsultationRevenue("We", 2500000),
    DailyConsultationRevenue("Th", 412000),
    DailyConsultationRevenue("Fri", 215000),
    DailyConsultationRevenue("Sa", 102000),
    DailyConsultationRevenue("Su", 150500),
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
          "Balance",
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
            InfoCard(
                device: "XAF",
                number: "4.500.000",
                icon: LineAwesomeIcons.wallet_solid,
                title: "Total Wins"),
            SizedBox(
              height: 20,
            ),
            Linerox("Amount earned per service (Per Day)", () {}),
            SizedBox(height: 20),
            stats3(),
            SizedBox(
              height: 20,
            ),
            Linerox("Amount win with consultation", () {}),
            SizedBox(
              height: 20,
            ),
            // stats1(),
            stats2(),
            SizedBox(
              height: 20,
            ),
            Linerox("Amount win with Medical Test", () {}),
            SizedBox(
              height: 20,
            ),
            stats1(),
            SizedBox(
              height: 20,
            ),
            Linerox("All Commissions", () {}),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: transactionList.length * 70 + 40,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionCard(
                    transaction: transactionList[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: transactionList.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  SfCartesianChart stats2() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(
            text: 'Days',
            textStyle: GoogleFonts.montserrat(
                color: blue, fontWeight: FontWeight.w600)),
      ),
      primaryYAxis: NumericAxis(
          // numberFormat:
          //     NumberFormat.currency(locale: 'fr_FR', symbol: 'Xaf'),
          ),
      series: <CartesianSeries>[
        BarSeries<DailyConsultationRevenue, String>(
          dataSource: data1,
          xValueMapper: (DailyConsultationRevenue data, _) => data.day,
          yValueMapper: (DailyConsultationRevenue data, _) => data.amount,
          pointColorMapper: (DailyConsultationRevenue data, _) {
            if (data.day == 'Mo') {
              return blue;
            } else if (data.day == 'Tu') {
              return green;
            } else if (data.day == 'We') {
              return Colors.yellow;
            } else if (data.day == 'Th') {
              return Colors.orange;
            } else if (data.day == 'Fri') {
              return Colors.red;
            } else if (data.day == 'Sa') {
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
    );
  }

  // Row line using for thr organisation of the screen
}

// this is composant using for fetch the statistics of payment by  medical test sort day,  week , mont and years
SfCartesianChart stats1() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(
      title: AxisTitle(text: 'Days'),
    ),
    series: <CartesianSeries>[
      AreaSeries<DailyConsultationRevenue, String>(
        color: blue,
        animationDelay: 10,
        dataSource: [
          DailyConsultationRevenue('Mo', 30000),
          DailyConsultationRevenue('Tu', 80000),
          DailyConsultationRevenue('We', 210000),
          DailyConsultationRevenue('Th', 190500),
          DailyConsultationRevenue('Fri', 20050),
          DailyConsultationRevenue('Sa', 250750),
          DailyConsultationRevenue('Su', 300250),
        ],
        xValueMapper: (DailyConsultationRevenue data, _) => data.day,
        yValueMapper: (DailyConsultationRevenue data, _) => data.amount,
        pointColorMapper: (DailyConsultationRevenue data, _) {
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

SfCircularChart stats3() {
  return SfCircularChart(
    legend: Legend(
      isVisible: true,
      overflowMode: LegendItemOverflowMode.wrap,
    ),
    series: <CircularSeries>[
      PieSeries<DailyService, String>(
        dataSource: [
          DailyService('Chirurgie', 150000.0),
          DailyService('Cardiologie', 120000.0),
          DailyService('Oncologie', 18000.0),
          DailyService('Pédiatrie', 120500.0),
          DailyService('Neurologie', 140750.0),
        ],
        xValueMapper: (DailyService data, _) => data.codeService,
        yValueMapper: (DailyService data, _) => data.amount,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
        ),
      ),
    ],
  );
}

class DailyConsultationRevenue {
  DailyConsultationRevenue(this.day, this.amount);
  final String day;
  final double amount;
}

class DailyService {
  DailyService(this.codeService, this.amount);

  final String codeService;
  final double amount;
}
