import 'package:flutter/material.dart';

class Consultation {
  final int id;
  final String name;
  final DateTime date;
  final String status;
  final String imageName;

  Consultation({
    required this.id,
    required this.name,
    required this.date,
    required this.imageName,
    required this.status,
  });
}

final List<Consultation> consultationList = [
  Consultation(
    id: 1,
    name: "Manuella",
    date: DateTime(2024, 06, 12),
    imageName: "1.png",
    status: "Complete",
  ),
  Consultation(
    id: 2,
    name: "Daniel",
    date: DateTime(2024, 12, 12),
    imageName: "téléchargement (1).jpg",
    status: "Waiting",
  ),
  Consultation(
    id: 3,
    name: "Daniella",
    date: DateTime(2024, 06, 12),
    imageName: "téléchargement (2).jpg",
    status: "Cancel",
  ),
  Consultation(
    id: 3,
    name: "Serrena",
    date: DateTime(2024, 06, 12),
    imageName: "téléchargement (1).jpg",
    status: "Complete",
  ),
  Consultation(
    id: 3,
    name: "Larissa",
    date: DateTime(2024, 06, 12),
    imageName: "téléchargement (2).jpg",
    status: "Waiting",
  ),
  Consultation(
    id: 3,
    name: "Veronique",
    date: DateTime(2024, 06, 12),
    imageName: "téléchargement (1).jpg",
    status: "Complete",
  ),
];
