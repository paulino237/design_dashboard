import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paiement'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _processPayment,
          child: Text('Payer'),
        ),
      ),
    );
  }

  Future<void> _processPayment() async {
    try {
      await processPayment();
      // Afficher un message de succès ou rediriger l'utilisateur vers une autre page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Paiement effectué avec succès'),
        ),
      );
    } catch (e) {
      // Afficher un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors du paiement: $e'),
        ),
      );
    }
  }
}

Future<void> processPayment() async {
  // Étape 1 : Obtenir le jeton d'accès
  var headers1 = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': 'Basic y54VfGUAOAUjL4oMFKUEfMAB0Qga'
  };
  var data1 = {'grant_type': 'client_credentials'};
  var dio = Dio();
  var response1 = await dio.request(
    'https://api-s1.orange.cm/token',
    options: Options(
      method: 'POST',
      headers: headers1,
    ),
    data: data1,
  );

  if (response1.statusCode == 200) {
    var accessToken = response1.data['access_token'];
    print('Access Token: $accessToken');

    // Étape 2 : Initialiser le paiement
    var headers2 = {
      'X-AUTH-TOKEN': 'WU5PVEVIRUFEMjpAWU5vVGVIRUBEMIBST0RBUEk=',
      'Authorization': 'Bearer $accessToken'
    };
    var response2 = await dio.request(
      'https://api-s1.orange.cm/omcoreapis/1.0.2/mp/init',
      options: Options(
        method: 'POST',
        headers: headers2,
      ),
      data: {},
    );

    if (response2.statusCode == 200) {
      var payToken = response2.data['payToken'];
      print('Pay Token: $payToken');

      // Étape 3 : Effectuer le paiement
      var headers3 = {
        'X-AUTH-TOKEN': 'WU5PVEVIRUFEMjpAWU5vVGVIRUBEMIBST0RBUEk=',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      var data3 = json.encode({
        "notifUrl": "https://www.y-note.cm/notification",
        "channelUserMsisdn": "659925202",
        "amount": "1",
        "subscriberMsisdn": "690379225",
        "pin": "1469",
        "orderId": "order1234",
        "description": "Commande 12345",
        "payToken": payToken
      });
      var response3 = await dio.request(
        'https://api-s1.orange.cm/omcoreapis/1.0.2/mp/pay',
        options: Options(
          method: 'POST',
          headers: headers3,
        ),
        data: data3,
      );

      if (response3.statusCode == 200) {
        print('Paiement effectué avec succès');
      } else {
        print('Erreur lors du paiement: ${response3.statusMessage}');
      }
    } else {
      print(
          'Erreur lors de l\'initialisation du paiement: ${response2.statusMessage}');
    }
  } else {
    print(
        'Erreur lors de l\'obtention du jeton d\'accès: ${response1.statusMessage}');
  }
}
