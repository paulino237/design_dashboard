import 'dart:convert';
import 'dart:math';

import 'package:design_dashboard/Constante.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http; 

class Paiement extends StatefulWidget {
  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  late String passwordSosan = "";
  late String getAccessToken;
  late String payToken;

  // Api for getAccessToken
  GetAcessToken() async {
    try {
      var headers = {'Authorization': 'Basic $passwordSosan'};
      var data = '''''';
      var dio = Dio();
      var response = await dio.request(
        'https://api-s1.orange.cm/token',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.statusMessage);
      }

      setState(() {
        getAccessToken = response.data['access_token'];
      });
    } catch (e) {}
  }

  // function using for init the paiement
  InitPaiement(String GetAccesstoken) async {
    try {
      var headers = {
        'X-AUTH-TOKEN': 'Votre X-AUTH-TOKEN',
        'Authorization': 'Bearer $GetAccesstoken'
      };
      var data = '''''';
      var dio = Dio();
      var response = await dio.request(
        'https://api-s1.orange.cm/omcoreapis/1.0.2/mp/init',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data;
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  var randonOrder = Random();
  // function for doing the paiement with orange money
  DoingPaiement(String amount, String GetaccessToken, String numberPatient,
      String paytokenStep2) async {
    try {
      var headers = {
        'X-AUTH-TOKEN': 'votre X-AUTH-TOKEN',
        'Content-Type': 'application/json',
        'Authorization': GetaccessToken
      };
      var data = json.encode({
        "notifUrl": "https://www.y-note.cm/notification",
        "channelUserMsisdn": "numero test de  SOSAN",
        "amount": amount,
        "subscriberMsisdn": numberPatient,
        "pin": "code pin de sosan",
        "orderId": randonOrder,
        "description": "Commande 12345",
        "payToken": paytokenStep2
      });
      var dio = Dio();
      var response = await dio.request(
        'https://api-s1.orange.cm/omcoreapis/1.0.2/mp/pay',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data;
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: () {
            // all step for doing the payment
            setState(() {
              loading = true;
            });
            //****************STEP  1 GET THE ACCESS TOKEN ******************/
            GetAcessToken;
            //****************STEP  2 INIT THE PAYMENT ******************/
            InitPaiement(getAccessToken).then((value) {
              // changement d'etat du Paytoken
              setState(() {
                payToken == value['data']['payToken'];
              });
            });

            //****************STEP  3 DOING THE PAYMENT ******************/
            DoingPaiement("1500", getAccessToken, "656552545", payToken)
                .then((value) {
              setState(() {
                loading = false;
              });
              if (value["status"] == "PENDING") {
                return AlertDialog(
                  title: Text('Payment Made Successfully'),
                  content: Text('You can now activate your appointment'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              } else {
                AlertDialog(
                  title: Text('Error For the Paiement '),
                  content: Text('Please Retry  this process ! '),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
            });
          },
          child: loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: blue,
                  ),
                )
              : Container(
                  width: 300,
                  //padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        green,
                        blue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    // border: Border(
                    //   top: BorderSide(color: Colors.grey[600]!, width: 1.0),
                    //   bottom: BorderSide(color: Colors.grey[600]!, width: 1.0),
                    // ),
                  ),
                  child: Center(
                    child: Text(
                      "Take Appointment",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
