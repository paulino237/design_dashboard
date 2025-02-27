import 'package:design_dashboard/Constante.dart';
import 'package:design_dashboard/Dashboards/HospitalDashboard/Component/model_appointment_hospital.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CardAppoitment extends StatelessWidget {
  late ModelAppointmentHospital modelAppointmentHospital;
  CardAppoitment({super.key, required this.modelAppointmentHospital});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // composant for check status of consultation
              Center(
                child: Container(
                  width: 85.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 239, 239),
                      borderRadius: BorderRadius.circular(13.0)),
                  child: Center(
                    child: Text(
                      modelAppointmentHospital.status,
                      style: GoogleFonts.montserrat(
                        color: modelAppointmentHospital.status == "Waiting"
                            ? Colors.orange
                            : modelAppointmentHospital.status == "Complete"
                                ? blue
                                : Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),

              // composant are using for the fetc image the doctors and the simple user
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Photo du docteur
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            "assets/img/${modelAppointmentHospital.imageDoctor}"), // Photo du docteur
                      ),
                      SizedBox(height: 8),
                      Text(
                        modelAppointmentHospital.nameDoctor, // Nom du docteur
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 3),
                      Text(
                        modelAppointmentHospital
                            .specialitieDoctor, // Nom du docteur
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: const Color(0xff8696BB)),
                      ),
                    ],
                  ),

                  Center(
                    child: Icon(
                      LineAwesomeIcons.arrow_alt_circle_right,
                      color: blue,
                      size: 50,
                    ),
                  ),

                  // Composant using for fetch the pic and name of simple user that have take the appointement
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            "assets/img/${modelAppointmentHospital.imageUser}"), // Photo du patient
                      ),
                      SizedBox(height: 8),
                      Text(
                        modelAppointmentHospital.SurnameUser, // Nom du patient
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 3),
                      Text(
                        modelAppointmentHospital.nameUser, // Nom du docteur
                        style: GoogleFonts.montserrat(
                            fontSize: 10, color: const Color(0xff8696BB)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Heure du rendez-vous et statut
              Row(
                children: [
                  // this composant using for the fetch date of the appointments
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.calendar,
                          color: blue,
                        ),
                        const Gap(3),
                        Text(
                          DateFormat('EEEE, d MMMM')
                              .format(modelAppointmentHospital.dateAppointment),
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: const Color(0xff8696BB),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Gap(8),

                  // this composant using for the fetch time of the appointments
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.clock,
                          color: blue,
                        ),
                        const Gap(8),
                        Text(
                          '11:00 - 12:00 AM',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: const Color(0xff8696BB),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Bouton Détails
              Center(
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          green,
                          blue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      'Détails',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
