import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButtonContainer extends StatelessWidget {
  final String title;
  final List<Color> clr;
  final Color overlayColor;
  final bool isGradientVertical;
  GradientButtonContainer({required this.title, required this.clr, required this.overlayColor,required this.isGradientVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(

                begin: isGradientVertical ?   Alignment.topCenter : Alignment.centerLeft ,
                end:  isGradientVertical ? Alignment.bottomCenter : Alignment.centerRight,
                colors: clr,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5),
              ),
            ),
            child: ElevatedButton(
              
              
              style: ButtonStyle(
                elevation: WidgetStateProperty.all<double>(0),
                overlayColor:WidgetStateProperty.all<Color>(overlayColor) ,
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))

              ),

              onPressed: (){},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.white,
                        ),
                                          ),
                ],
              ),

          ),
        ),
            ),
      ),

                    );
  }
}

