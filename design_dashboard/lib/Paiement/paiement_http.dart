import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentPage1 extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage1> {
  bool _isLoading = false;

  Future<void> _initiatePayment() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final paymentResult = await initiatePayment(
        customerKey: 'TxiJM6K7CANIpDpcunhzyGymeyoa',
        authorizationPassword: 'y54VfGUAOAUjL4oMFKUEfMAB0Qga',
        xAuthToken: 'WU5PVEVIRUFEMjpAWU5vVGVIRUBEMIBST0RBUEk=',
        notifUrl: 'https://www.y-note.cm/notification',
        channelUserMsisdn: '659925202',
        amount: '1',
        subscriberMsisdn: '690379225',
        pin: '1469',
        orderId: 'order1234',
        description: 'Commande 12345',
      );

      // Traiter le résultat du paiement
      print(paymentResult);

      // Afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Paiement réussi')),
      );
    } catch (e) {
      // Afficher un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de paiement: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Money Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _isLoading ? null : _initiatePayment,
          child: _isLoading ? CircularProgressIndicator() : Text('Payer'),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> initiatePayment({
  required String customerKey,
  required String authorizationPassword,
  required String xAuthToken,
  required String notifUrl,
  required String channelUserMsisdn,
  required String amount,
  required String subscriberMsisdn,
  required String pin,
  required String orderId,
  required String description,
}) async {
  // Obtenir le jeton d'autorisation
  final authorizationHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': 'Basic base64(y54VfGUAOAUjL4oMFKUEfMAB0Qga)',
  };
  final authorizationResponse = await http.post(
    Uri.parse('https://api-s1.orange.cm/token'),
    body: {'grant_type': 'client_credentials'},
    headers: authorizationHeaders,
  );

  if (authorizationResponse.statusCode == 200) {
    final authorizationToken =
        json.decode(authorizationResponse.body)['access_token'];

    // Initialiser le paiement
    final initHeaders = {
      'X-AUTH-TOKEN': xAuthToken,
      'Authorization': 'Bearer $authorizationToken',
    };
    final initResponse = await http.post(
      Uri.parse('https://api-s1.orange.cm/omcoreapis/1.0.2/mp/init'),
      headers: initHeaders,
    );

    if (initResponse.statusCode == 200) {
      final payToken = json.decode(initResponse.body)['payToken'];

      // Effectuer le paiement
      final paymentHeaders = {
        'X-AUTH-TOKEN': xAuthToken,
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authorizationToken',
      };
      final paymentBody = {
        "notifUrl": notifUrl,
        "channelUserMsisdn": channelUserMsisdn,
        "amount": amount,
        "subscriberMsisdn": subscriberMsisdn,
        "pin": pin,
        "orderId": orderId,
        "description": description,
        "payToken": payToken,
      };
      final paymentResponse = await http.post(
        Uri.parse('https://api-s1.orange.cm/omcoreapis/1.0.2/mp/pay'),
        headers: paymentHeaders,
        body: json.encode(paymentBody),
      );

      if (paymentResponse.statusCode == 200) {
        return json.decode(paymentResponse.body);
      } else {
        throw Exception('Payment failed: ${paymentResponse.reasonPhrase}');
      }
    } else {
      throw Exception(
          'Payment initialization failed: ${initResponse.reasonPhrase}');
    }
  } else {
    throw Exception(
        'Authorization failed: ${authorizationResponse.reasonPhrase}');
  }
}
