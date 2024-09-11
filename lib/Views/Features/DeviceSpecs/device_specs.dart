import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Features/DeviceInfo/two_value_card.dart';

class DeviceSpecs extends StatelessWidget {
  const DeviceSpecs({super.key});

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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF02A9AF), Color(0xFF00CDAC)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Device Information",
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                  text: "Total Run",
                                  value: "5.36 GB",
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                  text: "Refresh Rate",
                                  value: "60 Hz",
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                  text: "Fingerprint Sensor",
                                  value: "Present",
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                  text: "Fingerprint Sensor",
                                  value: "Yes",
                                ),
                              )),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            child: TwoValueCard(
                              text: "Internal Memory",
                              value: "59.36 / 110.05 GB",
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: TwoValueCard(
                              text: "External Memory",
                              value: "N/A",
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: TwoValueCard(
                              text: "Screen Size",
                              value: "6.06 inches",
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: TwoValueCard(
                              text: "Resolution",
                              value: "2134*1080",
                            ),
                          )),
                        ],
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
