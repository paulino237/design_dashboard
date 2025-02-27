class ModelAppointmentHospital {
  final int id;
  final String nameUser;
  final String nameDoctor;
  final String SurnameUser;
  final String specialitieDoctor;
  final String status;
  final String imageDoctor;
  final String imageUser;
  final DateTime dateAppointment;
  // constructeur
  ModelAppointmentHospital(
      {required this.id,
      required this.nameUser,
      required this.specialitieDoctor,
      required this.nameDoctor,
      required this.SurnameUser,
      required this.status,
      required this.imageDoctor,
      required this.imageUser,
      required this.dateAppointment});
}

// Map  using for display the information of the consultation
final List<ModelAppointmentHospital> modelappointment = [
  ModelAppointmentHospital(
      id: 1,
      nameUser: "Sosan",
      nameDoctor: "Daniel",
      SurnameUser: "space",
      status: "Waiting",
      imageDoctor: "1.png",
      imageUser: "téléchargement (1).jpg",
      dateAppointment: DateTime(2024, 1, 12),
      specialitieDoctor: 'Dentist'),
  ModelAppointmentHospital(
      id: 2,
      nameUser: "Dimitri",
      nameDoctor: "Jonh",
      SurnameUser: "Romaric",
      status: "Cancel",
      imageDoctor: "1.png",
      imageUser: "téléchargement (2).jpg",
      dateAppointment: DateTime(2023, 7, 25),
      specialitieDoctor: 'Cardiologue'),
  ModelAppointmentHospital(
      id: 3,
      nameUser: "Ledoux",
      nameDoctor: "Brice",
      SurnameUser: "Julien",
      status: "Complete",
      imageDoctor: "1.png",
      imageUser: "téléchargement (3).jpg",
      dateAppointment: DateTime(2023, 5, 15),
      specialitieDoctor: 'Generaliste'),
  ModelAppointmentHospital(
      id: 4,
      nameUser: "Dylan",
      nameDoctor: "Paulin",
      SurnameUser: "Julien",
      status: "Waiting",
      imageDoctor: "1.png",
      imageUser: "téléchargement (1).jpg",
      dateAppointment: DateTime(2023, 3, 25),
      specialitieDoctor: 'Radiologue'),
];
