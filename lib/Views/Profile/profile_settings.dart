import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Profile/pr_setting_heading.dart';
import 'package:tyamo/Views/Profile/pr_setting_sub.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 330,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 130),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 23,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w900,
                              fontSize: 23,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Row(
                                children: [
                                  CircularProfileAvatar("",
                                      backgroundColor: Colors.transparent,
                                      borderWidth: 1,
                                      borderColor: Colors.purple,
                                      elevation: 5.0,
                                      radius: 30,
                                      errorWidget: (context, url, error) {
                                        return Icon(
                                          Icons.face,
                                          size: 20,
                                        );
                                      },
                                      cacheImage: true,
                                      onTap: () async {},
                                      animateFromOldImageOnUrlChange: true,
                                      placeHolder: (context, url) {
                                        return Container(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Rashid",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.nunito(
                                        letterSpacing: 0.5,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.grey.shade200,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            PrSettingHeading(headingText: "Profile Setting"),
                            SizedBox(
                              height: 15,
                            ),
                            PrSettingSub(
                              title: "Edit Name",
                            ),
                            PrSettingSub(
                              title: "Edit Phone Number",
                            ),
                            PrSettingSub(
                              title: "Change Password",
                            ),
                            PrSettingSub(
                              title: "Email Status",
                              secondaryWidget: Row(
                                children: [
                                  Text(
                                    "Not Verified",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.arrowRight,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            PrSettingHeading(headingText: "Notification Setting"),
                            SizedBox(
                              height: 15,
                            ),
                            PrSettingSub(
                              title: "Push Notifications",
                              secondaryWidget: GFToggle(
                                onChanged: (val) {},
                                value: true,
                                enabledTrackColor: Colors.greenAccent,
                                type: GFToggleType.android,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            PrSettingHeading(headingText: "Application Setting"),
                            SizedBox(
                              height: 15,
                            ),
                            PrSettingSub(
                              title: "Background Updates",
                              secondaryWidget: Row(
                                children: [
                                  Text(
                                    "Not Allowed",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.arrowRight,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
