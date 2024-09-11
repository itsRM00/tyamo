import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../DeviceInfo/two_value_card.dart';

class BatteryInfo extends StatelessWidget {
  const BatteryInfo({super.key});

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
              Color(0xFFFAD585),
              Color(0xFFF47A7D),
            ],
          ),
        ),
        child: Column(children: [

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Battery Status",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              )),


          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                          children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: TwoValueCard(
                          value: "Discharge",
                          text: "Status",
                          txtclr: Color(0xFFF57D7C),
                        ),
                      ),
                      Expanded(
                        child: TwoValueCard(
                          value: "_",
                          text: "Charging Type",
                          txtclr: Color(0xFFF57D7C),
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
                          child: TwoValueCard(
                            value: "N/A",
                            text: "Charging\n Percentage",
                            txtclr: Color(0xFFF57D7C),
                            subWidget: SleekCircularSlider(
                              min: 0,
                              max: 100,
                              appearance: CircularSliderAppearance(
                                customColors: CustomSliderColors(
                                    progressBarColor: Color(0xFFF57D7C)),
                                infoProperties: InfoProperties(
                                  mainLabelStyle: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400),
                                ),
                                size: 70,
                                customWidths:
                                    CustomSliderWidths(progressBarWidth: 7),
                              ),
                              initialValue: 50,
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: TwoValueCard(
                          value: "35.0",
                          text: "Temprature",
                          txtclr: Color(0xFFF57D7C),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: TwoValueCard(
                          value: "Good",
                          text: "Battery Health",
                          txtclr: Color(0xFFF57D7C),
                        ),
                      ),
                      Expanded(
                        child: TwoValueCard(
                          value: "Li-poly",
                          text: "Battery \n Technology",
                          txtclr: Color(0xFFF57D7C),
                        ),
                      )
                    ],
                  ),
                ),
              )
                          ],
                        ),),),
          Expanded(
            child: Container(

              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Battery Status:",
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color:Color(0xff989898),
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
                                          value: "Discharge",
                                          text: "Status",
                                          txtclr: Colors.white,
                                          clr:Color(0xFFF57D7C) ,
                                        ),
                                      ),
                                      Expanded(
                                        child: TwoValueCard(
                                          value: "_",
                                          text: "Charging Type",
                                          txtclr: Colors.white,
                                          clr:Color(0xFFF57D7C) ,
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

                                          child: TwoValueCard(
                                            value: "N/A",
                                            text: "Charging\n Percentage",
                                            txtclr: Colors.white,
                                            clr:Color(0xFFF57D7C) ,
                                            subWidget: SleekCircularSlider(
                                              min: 0,
                                              max: 100,
                                              appearance: CircularSliderAppearance(
                                                customColors: CustomSliderColors(
                                                    progressBarColor: Colors.white),
                                                infoProperties: InfoProperties(
                                                  mainLabelStyle: GoogleFonts.nunito(
                                                      fontWeight: FontWeight.w400,
                                                  color: Colors.white
                                                  ),
                                                ),
                                                size: 70,
                                                customWidths:
                                                CustomSliderWidths(progressBarWidth: 7),
                                              ),
                                              initialValue: 50,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: TwoValueCard(
                                          value: "35.0",
                                          text: "Temprature",
                                          txtclr: Colors.white,
                                          clr:Color(0xFFF57D7C) ,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: TwoValueCard(
                                          value: "Good",
                                          text: "Battery Health",
                                          txtclr: Colors.white,
                                          clr:Color(0xFFF57D7C) ,
                                        ),
                                      ),
                                      Expanded(
                                        child: TwoValueCard(
                                          value: "Li-poly",
                                          text: "Battery \n Technology",
                                          txtclr: Colors.white,
                                          clr:Color(0xFFF57D7C) ,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ))),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
