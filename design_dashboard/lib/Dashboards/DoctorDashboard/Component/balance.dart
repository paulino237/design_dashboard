import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/Infocard.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/model_transaction.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/transactionCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Balance extends StatelessWidget {
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
              "All Transaction",
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
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoCard(
                device: 'XAF',
                number: '340.0000',
                icon: LineAwesomeIcons.wallet_solid,
                title: 'Total Earnings',
              ),
              SizedBox(
                height: 20,
              ),
              Linerox("Earnings Statistics", () {}),
              SizedBox(
                height: 20,
              ),
              Center(
                child: stats(),
              ),
              SizedBox(
                height: 20,
              ),
              Linerox("All Commissions", () {}),
              SizedBox(
                height: 20,
              ),
              // this is the component for fetch the tranasaction doing for the doctor
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
      ),
    );
  }

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

  SfCartesianChart stats() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Days'),
      ),
      series: <CartesianSeries>[
        SplineSeries<DailyRevenue, String>(
          dataSource: [
            DailyRevenue('Mo', 1500),
            DailyRevenue('Tu', 8000),
            DailyRevenue('We', 2100),
            DailyRevenue('Th', 1950),
            DailyRevenue('Fri', 2000),
            DailyRevenue('Sa', 2500),
            DailyRevenue('Su', 3000),
          ],
          xValueMapper: (DailyRevenue data, _) => data.day,
          yValueMapper: (DailyRevenue data, _) => data.revenue,
          pointColorMapper: (DailyRevenue data, _) {
            if (data.day == 'Mo') {
              return blue;
            } else if (data.day == 'Tu') {
              return green;
            } else if (data.day == 'We') {
              return Colors.yellow;
            } else if (data.day == 'Th') {
              return const Color.fromARGB(255, 36, 24, 145);
            } else if (data.day == 'Fri') {
              return const Color.fromARGB(255, 231, 42, 28);
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
}

// models of Daily revenu
class DailyRevenue {
  DailyRevenue(this.day, this.revenue);
  final String day;
  final double revenue;
}
