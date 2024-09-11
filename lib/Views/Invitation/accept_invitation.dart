import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcceptInvitation extends StatelessWidget {
  const AcceptInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Container(
            height: 40,
            child: Image.asset(
              "assets/images/logo.jpg",
              filterQuality: FilterQuality.high,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 55,
            color: Color(0xff00D7CC),
            child: Text(
              "See received invitations",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                fontSize: 19.sp,
              ),
              textScaleFactor: 1,
            ),
          ),
          SizedBox(
            height: 50,
          ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Container(
              height: 80,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 5, 15),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: CircularProfileAvatar(
                              "",
                              backgroundColor: Colors.blue,
                              radius: 35,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                "@Ra5418yz",
                                style: GoogleFonts.poppins(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.0),
                              child: Text(
                                "@Rashid",
                                style:
                                    GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GFButton(
                                color: Colors.cyan,
                                shape: GFButtonShape.pills,
                                child: Text("Accept"),
                                onPressed: () {},
                              ),
                              SizedBox(width: 10,),
                              GFButton(
                                color: Colors.red,
                                shape: GFButtonShape.pills,
                                child: Text("Decline"),
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
          Container(
            height: 300,
            width: 300,
            alignment: Alignment.center,
            child: Image.asset("assets/images/empty.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your received invitation are currently ",
                style: GoogleFonts.nunito(
                    color: Colors.cyan, fontWeight: FontWeight.bold,fontSize: 14.sp),
              ),
              Text(
                "Empty",
                style: GoogleFonts.nunito(
                    color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 14.sp),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
