import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Invitation/accept_invitation.dart';

class InviteFriend extends StatelessWidget {
  const InviteFriend({super.key});

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
          leading: null,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: AcceptInvitation(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.purple,
                  size: 35,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 27.sp,
              color: Color(0xff00D7CC),
              child: Text(
                "Find your friend",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  fontSize: 16.sp,
                ),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                )
                              ]),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              hintText: "Hi Rashid, Type an exact username",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                          )
                        ]),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Card(
            //     elevation: 10,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(50),
            //       ),
            //     ),
            //     child: Container(
            //       height: 80,
            //       child: SingleChildScrollView(
            //         child: Column(
            //           children: [
            //             Row(
            //               children: [
            //                 Padding(
            //                   padding: EdgeInsets.fromLTRB(10, 10, 5, 15),
            //                   child: Container(
            //                     height: 60,
            //                     width: 60,
            //                     child: CircularProfileAvatar(
            //                       "",
            //                       backgroundColor: Colors.blue,
            //                       radius: 35,
            //                     ),
            //                   ),
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Padding(
            //                       padding: EdgeInsets.only(top: 5, bottom: 5),
            //                       child: Text(
            //                         "@Ra5418yz",
            //                         style: GoogleFonts.poppins(fontSize: 17),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: EdgeInsets.only(left: 0.0),
            //                       child: Text(
            //                         "@Rashid",
            //                         style:
            //                             GoogleFonts.poppins(color: Colors.grey),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Spacer(),
            //                 Padding(
            //                   padding: EdgeInsets.all(8.0),
            //                   child: Row(
            //                     children: [
            //                       GFButton(
            //                         color: Colors.cyan,
            //                         shape: GFButtonShape.pills,
            //                         child: Text("Accept"),
            //                         onPressed: () {},
            //                       ),
            //                       GFButton(
            //                         color: Colors.red,
            //                         shape: GFButtonShape.pills,
            //                         child: Text("Decline"),
            //                         onPressed: () {},
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/invite.png"),
            ),
            Text(
              "Search for your friend on tyamo or\n invite your friend on tyamo",
              style: GoogleFonts.nunito(
                  color: Colors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Invite a friend",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
