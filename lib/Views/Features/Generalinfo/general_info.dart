import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Features/Generalinfo/two_widget_card.dart';

import '../DeviceInfo/two_value_card.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            "assets/images/logo.jpg",
          ))),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF50C9C2),
              Color(0xFF95DEDA),
            ],
          ),
        ),
        child: Column(
          children: [

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "General Info",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: TwoValueCard(
                                value: "Screen State",
                                text: "UNLOCKED",
                                txtclr: Color(0xff55CAC4),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TwoWidgetCardCard(
                                value1: "0 / 7",
                                text1: "System Volume",
                                txtclr1: Color(0xff55CAC4),
                                text2: "Media Volume",
                                value2: "4 / 7",
                                txtclr2: Color(0xff55CAC4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TwoWidgetCardCard(
                              value1: "Dim Light",
                              text1: "Light Activity",
                              txtclr1: Color(0xff55CAC4),
                              text2: "Light Intensity",
                              value2: "4",
                              txtclr2: Color(0xff55CAC4),
                            ),
                          ),
                          Expanded(
                            child: TwoValueCard(
                              value: "Brightness",
                              text: "5.88%",
                              txtclr: Color(0xff55CAC4),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Text(
              "Last Updated: 1 min ago",
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
            ),

            Expanded(
flex: 10,
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My General Info:",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff989898),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(

                      child: Row(

                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: TwoValueCard(
                                      value: "Screen State",
                                      text: "UNLOCKED",
                                      clr: Color(0xff55CAC4),
                                      txtclr: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TwoWidgetCardCard(
                                      value1: "0 / 7",
                                      text1: "System Volume",
                                      clr1: Color(0xff55CAC4),
                                      txtclr1: Colors.white,
                                      text2: "Media Volume",
                                      value2: "4 / 7",
                                      clr2: Color(0xff55CAC4),
                                      txtclr2: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TwoWidgetCardCard(
                                    value1: "Dim Light",
                                    text1: "Light Activity",
                                    clr1: Color(0xff55CAC4),
                                    txtclr1: Colors.white,
                                    text2: "Light Intensity",
                                    value2: "4",
                                    clr2: Color(0xff55CAC4),
                                    txtclr2: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: TwoValueCard(
                                    value: "Brightness",
                                    text: "5.88%",
                                    clr: Color(0xff55CAC4),
                                    txtclr: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
