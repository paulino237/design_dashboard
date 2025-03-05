import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/balance.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/Component/consultation.dart';
import 'package:design_dashboard/Dashboards/DoctorDashboard/DoctorDashboard.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/ConsultationHospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/DoctorHospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/MedicalTest.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/balance_hospital.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/HospitalDashboard.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashConsultation/consultationUser.dart';
import 'package:design_dashboard/Dashboards/UserDashboard/DashTest/test.dart';
import 'package:design_dashboard/Doctor/detail_page.dart';
import 'package:design_dashboard/Home.dart';
import 'package:design_dashboard/InfoDoctor.dart/InfoDoctor.dart';
import 'package:design_dashboard/Paiement/PaiementOrangeMoney.dart';
import 'package:design_dashboard/Paiement/paiement.dart';
import 'package:design_dashboard/Paiement/paiement_http.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DashBoard SOSAN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PaymentPage1(),
    );
  }
}
