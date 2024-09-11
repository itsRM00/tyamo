import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tyamo/Views/Features/Album/friend_album.dart';
import 'package:tyamo/Views/Features/Album/my_album.dart';

class AlbumMain extends StatefulWidget {
  const AlbumMain({super.key});

  @override
  State<AlbumMain> createState() => _AlbumMainState();
}

class _AlbumMainState extends State<AlbumMain>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  late CurvedAnimation curve;

  List<IconData> iconList = [
    Icons.person_outline,
    Icons.people,
  ];

  int page = 0;
  int pageView = 0;
  PageController pageController = PageController(initialPage: 0);
  Widget pageViewSelection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        MyAlbum(),
       FriendAlbum()
      ],
    );
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    curve = CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(curve);
    animationController.forward();
    super.initState();
  }

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
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          splashColor: Colors.yellow,
          elevation: 5,
          backgroundColor: Colors.yellow,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: page,
        activeColor: Colors.purple,
        inactiveColor: Colors.black,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        onTap: (p0) {
          setState(
            () {
              pageView = p0;
              pageController.animateToPage(p0,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
          );
        },
      ),
      body: pageViewSelection(),
    );
  }
}
