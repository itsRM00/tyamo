import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Features/DeviceInfo/top_banner.dart';

import 'gradient_button_container.dart';

class DeviceInfo extends StatelessWidget {
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
      body: Column(
        children: [
          TopBanner(
            title: " DeviceInfo ",
            clr: [Color(0xff4FC174), Color(0xff00D7A9)],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),

            child: Row(
              children: [
                Expanded(
                  
                    
                    child: Column(
                      children: [
                        Expanded(
                          flex: 10,
                            child: GradientButtonContainer(
                          title: "User Status",
                              overlayColor: Colors.cyan,
                          clr: const [Color(0xFF86AAE8), Color(0xFF92E9E3)],
                          isGradientVertical: true,
                        )),
                        Expanded(
                          flex: 6,
                            child: GradientButtonContainer(
                              title: "Battery",
                              overlayColor: Colors.orangeAccent,
                              clr:  [Color(0xFFFAD585), Color(0xFFF47A7D)],
                              isGradientVertical: false,
                            )),
                      ],
                    ),
                  ),
                
                Expanded(
                        child: GradientButtonContainer(
                          title: "General",
                          overlayColor: Colors.teal.shade300,
                          clr: [Color(0xFF50C9C2), Color(0xFF95DEDA)],
                          isGradientVertical: true,
                        )),
    ],
                  ),
                ),
          ),
          Expanded(
            
              child: Row(
                children: [
                  Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: GradientButtonContainer(
                  title: "Device Specs",
                  overlayColor: Color(0xff01BCAA),
                  clr:  [Color(0xFF02A9AF), Color(0xFF00CDAC)],
                  isGradientVertical: true,
                ),
              )),
                  Expanded(


                    child: Column(
                      children: [
                        Expanded(
                            flex: 6,
                            child: GradientButtonContainer(
                              title: "Location",
                              overlayColor: Color(0xffB159C6),
                              clr:  [Color(0xFFB893D6), Color(0xFF8CA5DB)],
                              isGradientVertical: false,
                            )),
                        Expanded(
                            flex: 10,
                            child: GradientButtonContainer(
                              title: "Orientation",
                              overlayColor: Color(0xffF98583),
                              clr:  [Color(0xFFF2709B), Color(0xFFFF9370)],

                              isGradientVertical: true,
                            )),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
