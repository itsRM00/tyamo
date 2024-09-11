import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OneValueCard extends StatelessWidget {
  final String value;
  final Color clr;
  OneValueCard({required this.value, required this.clr,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      width: 103,
      child: Card(
        color: clr,
        elevation: 10,
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color:  Colors.white),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
