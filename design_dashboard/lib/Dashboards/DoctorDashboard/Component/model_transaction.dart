import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String name;
  final DateTime date;
  final double price;
  final String imageName;

  Transaction({
    required this.id,
    required this.name,
    required this.date,
    required this.imageName,
    required this.price,
  });
}

final List<Transaction> transactionList = [
  Transaction(
    id: 1,
    name: "SOSAN",
    date: DateTime(2024, 06, 12),
    imageName: "sosan.png",
    price: 21352,
  ),
  Transaction(
    id: 2,
    name: "SOSAN",
    date: DateTime(2025, 06, 10),
    imageName: "sosan.png",
    price: 13200,
  ),
  Transaction(
    id: 3,
    name: "SOSAN",
    date: DateTime(2024, 05, 12),
    imageName: "sosan.png",
    price: 11343,
  ),
  Transaction(
    id: 3,
    name: "SOSAN",
    date: DateTime(2024, 07, 17),
    imageName: "sosan.png",
    price: 11343,
  ),
  Transaction(
    id: 3,
    name: "SOSAN",
    date: DateTime(2024, 06, 12),
    imageName: "sosan.png",
    price: 11343,
  ),
  Transaction(
    id: 3,
    name: "SOSAN",
    date: DateTime(2024, 06, 12),
    imageName: "sosan.png",
    price: 11343,
  ),
];
