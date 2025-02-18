import 'package:flutter/material.dart';

class TextItems extends StatelessWidget {
  String text1;
  String text2;
  Color color1;
  Color colortext2;
  TextItems({
    required this.text1,
    required this.text2,
    required this.color1,
    required this.colortext2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 18.0),
            child: Text(text1,
                style: TextStyle(
                    fontSize: 18, color: color1, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: InkWell(
            onTap: () {},
            child: Text(
              text2,
              style: TextStyle(fontWeight: FontWeight.bold, color: colortext2),
            ),
          ),
        )
      ],
    );
  }
}
