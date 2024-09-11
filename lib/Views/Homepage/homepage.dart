import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Homepage/dashboard.dart';
import 'package:tyamo/Views/Profile/profile.dart';
import 'package:tyamo/Views/widgets/Homepage/drawer_list_tile.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _homepageKey = GlobalKey();
  List<IconData> iconList = [
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.house,
    FontAwesomeIcons.bell
  ];
  int page = 1;
  int pageView = 1;
  PageController pageController = PageController(initialPage: 1);
  Widget pageViewSelection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        Profile(),
        Dashboard(),
        Container(
          color: Colors.cyan,
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _homepageKey,
      appBar: AppBar(
        elevation: 0,
        title: Container(
          height: 100,
          width: 100,
          child: Image.asset(
            "assets/images/logo.jpg",
            filterQuality: FilterQuality.high,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            _homepageKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            width: 70,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              "assets/dashboard/messages.jpg",
              filterQuality: FilterQuality.high,
            ),
          )
        ],
      ),
      drawer: GFDrawer(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        child: CircularProfileAvatar("",
                            backgroundColor: Colors.cyan,
                            borderWidth: 1,
                            borderColor: Colors.deepPurple,
                            elevation: 20,
                            radius: 40,
                            cacheImage: true,
                            errorWidget: (context, url, error) {
                              return Icon(
                                Icons.face,
                                size: 50,
                              );
                            },
                            onTap: () {
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                              Navigator.of(context).pop();
                            },
                            animateFromOldImageOnUrlChange: true,
                            placeHolder: (context, url) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }),
                      ),
                      Flexible(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rashid",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1),
                          ),
                          Text(
                            "Ra5418@tyamo.com",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                letterSpacing: 0,
                                color: Colors.cyan),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Text(
                        "Premium",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(),
            ),
            Column(
              children: [
                DrawerListTile(
                    iconName: FontAwesomeIcons.solidCreditCard,
                    tileTitle: "Subscripton"),
                DrawerListTile(iconName: Icons.settings, tileTitle: "Settings"),
                DrawerListTile(
                    iconName: FontAwesomeIcons.circleQuestion,
                    tileTitle: "Help"),
                DrawerListTile(
                    iconName: FontAwesomeIcons.message, tileTitle: "Feedback"),
                DrawerListTile(
                    iconName: FontAwesomeIcons.share, tileTitle: "Tell Others"),
                DrawerListTile(
                    iconName: FontAwesomeIcons.starHalfStroke,
                    tileTitle: "Rate this App"),
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(),
                  DrawerListTile(
                      iconName: FontAwesomeIcons.rightFromBracket,
                      tileTitle: "Sign out")
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: page,
        activeColor: Colors.purple,
        inactiveColor: Colors.black,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        onTap: (p0) {
          setState(() {
            pageView = p0;
            pageController.animateToPage(p0,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
      ),
      body: pageViewSelection(),
    );
  }
}
