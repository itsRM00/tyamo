import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class authHeading extends StatelessWidget {
  final String mainText;
  final String subText;
  final String logo;
  final double fontSize;
  final double logoSize;
  authHeading(
      {required this.fontSize,
      required this.logoSize,
      required this.logo,
      required this.mainText,
      required this.subText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              mainText,
              style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: Color(0xff00205c),
                  fontWeight: FontWeight.bold),
            ),
            Container(
                width: 30,
                height: logoSize,
                child: Image.asset(
                  logo,
                  filterQuality: FilterQuality.high,
                ))
          ],
        ),
        Text(
          subText,
          style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: Color(0xff00205c),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
