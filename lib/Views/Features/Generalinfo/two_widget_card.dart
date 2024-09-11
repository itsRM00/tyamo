import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwoWidgetCardCard extends StatelessWidget {
  final String text1;
  final String value1;
  final Color? clr1;
  final Color? txtclr1;
  final Widget? subWidget1;
  final String text2;
  final String value2;
  final Color? clr2;
  final Color? txtclr2;
  final Widget? subWidget2;

  TwoWidgetCardCard(
      {required this.value1,
      required this.text1,
      this.clr1,
      this.txtclr1,
      this.subWidget1,
      required this.value2,
        required this.text2,
        this.clr2,
        this.txtclr2,
        this.subWidget2



      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: Card(
        elevation: 10,
        color: clr1 ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  subWidget1 ??
                      Text(
                        value1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            color: txtclr1 ?? Color(0xFFF57D7C),
                            fontSize: 18),
                      )
                ],
              ),
            ),
            SizedBox(height:10 ,),
            Container(
              child: Column(
                children: [
                  Text(
                    text2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  subWidget2 ??
                      Text(
                        value2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            color: txtclr2 ?? Color(0xFFF57D7C),
                            fontSize: 18),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
