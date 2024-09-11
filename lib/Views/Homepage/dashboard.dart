import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Homepage/Dashboard_gradient_feature.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "DASHBOARD",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Friend",
                textAlign: TextAlign.left,
                style: GoogleFonts.nunito(
                    color: const Color(0xff990099),
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    letterSpacing: 1),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 25.0),
                              child: CircularProfileAvatar("",
                                  backgroundColor: Colors.cyan,
                                  borderWidth: 1,
                                  borderColor: Colors.deepPurple,
                                  elevation: 20,
                                  radius: 45,
                                  cacheImage: true,
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                      Icons.face,
                                      size: 50,
                                    );
                                  },
                                  onTap: () {},
                                  animateFromOldImageOnUrlChange: true,
                                  placeHolder: (context, url) {
                                    return Container(
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.fiber_manual_record,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Rashid",
                                        style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Haroonabad,Pakistan",
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Status",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Offline",
                                    style: GoogleFonts.nunito(
                                        fontSize: 17,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 2,
                            child: Container(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "User Status",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "N/A",
                                    style: GoogleFonts.nunito(
                                        fontSize: 17,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 2,
                            child: Container(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                "User Status",
                                style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                    child: DashboardGradientFeature(
                  iconImg: "assets/dashboard/device.png",
                  btnText: "Device Info",
                  clr: [
                    const Color(0xff4FC174),
                    const Color(0xff00D7A9),
                  ],
                )),
                Flexible(
                    child: DashboardGradientFeature(
                  iconImg: "assets/dashboard/gallery.png",
                  btnText: "Gallery",
                  clr: [
                    const Color(0xffF7DB00),
                    const Color(0xffF7A100),
                  ],
                )),
                Flexible(
                    child: DashboardGradientFeature(
                  iconImg: "assets/dashboard/mood.png",
                  btnText: "Mood",
                  clr: [
                    const Color(0xff9A01D6),
                    const Color(0xffC701D6),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Features",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunito(
                    color: const Color(0xff004C99),
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/playlist.png",
                    btnText: "Playlist",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/location.png",
                    btnText: "Location",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/todo.png",
                    btnText: "To-do List",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/diary.png",
                    btnText: "Diary",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/notes.png",
                    btnText: "Surprize Notes",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/horoscope.png",
                    btnText: "Horoscopes",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/sos.png",
                    btnText: "Emergency SOS",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: DashboardGradientFeature(
                    iconImg: "assets/dashboard/activity.png",
                    btnText: "Activity",
                    weight: FontWeight.w900,
                    clr: [
                      Colors.white,
                      Colors.white,
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
