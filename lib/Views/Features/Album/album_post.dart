import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui' as prefix0;

import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Views/Features/Album/image_view.dart';

class AlbumPost extends StatelessWidget {
  const AlbumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/gallery.jpg"),
                      fit: BoxFit.cover,
                    )),
                    child: BackdropFilter(
                      filter: prefix0.ImageFilter.blur(sigmaX: 7, sigmaY: 14),
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Image.asset("assets/images/logo.jpg"),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: GFAvatar(
                                    backgroundColor: Colors.blue,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(50),
                                child: GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Hero(
                                      tag: "assets/images/gallery.jpg",
                                      child: Image.asset(
                                        "assets/images/gallery.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: ImageView(
                                            url: "assets/images/gallery.jpg",
                                          )),
                                    );
                                  },
                                )),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Container(
                                width: 250,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    BalloonSlider(
                                      value: 0,
                                      showRope: false,
                                      onChangeStart: (value) {},
                                      onChangeEnd: (value) {},
                                      onChanged: (value) {},
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Caption",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: Colors.cyan),
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.edit,
                              color: Colors.cyan,
                            ),
                            onTap: () {
                              AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.noHeader,
                                      title: "Edit Caption",
                                      body: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          child: TextField(
                                            controller: null,
                                            decoration: InputDecoration(
                                              labelText: "Enter new caption",
                                              labelStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Nunito"),
                                              fillColor: Colors.black,
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                  )),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            minLines: 1,
                                            maxLines: null,
                                          ),
                                        ),
                                      ),
                                      dismissOnBackKeyPress: true,
                                      isDense: false,
                                      btnOkText: "Confirm Caption",
                                      btnOkOnPress: () {})
                                  .show();
                            },
                          ),
                        ],
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.50,
                        blurSize: 2.0,
                        menuItemExtent: 45,
                        menuBoxDecoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        duration: Duration(milliseconds: 100),
                        animateMenuItems: true,
                        blurBackgroundColor: Colors.black54,
                        // Open Focused-Menu on Tap rather than Long Press
                        menuOffset:
                            10.0, // Offset value to show menuItem from the selected item
                        bottomOffsetHeight:
                            80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                        menuItems: <FocusedMenuItem>[
                          // Add Each FocusedMenuItem  for Menu Options
                          FocusedMenuItem(
                              title: Text(
                                "Copy",
                                textScaleFactor: 1,
                                style: GoogleFonts.nunito(color: Colors.black),
                              ),
                              trailingIcon: Icon(FontAwesomeIcons.copy),
                              onPressed: () {}),
                          FocusedMenuItem(
                              backgroundColor: Colors.red,
                              title: Text(
                                "Edit",
                                textScaleFactor: 1,
                                style: GoogleFonts.nunito(color: Colors.white),
                              ),
                              trailingIcon: Icon(FontAwesomeIcons.edit,
                                  color: Colors.white),
                              onPressed: () {
                                AwesomeDialog(
                                        context: context,
                                        animType: AnimType.scale,
                                        dialogType: DialogType.noHeader,
                                        title: "Edit Caption",
                                        body: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20),
                                            child: TextField(
                                              controller: null,
                                              decoration: InputDecoration(
                                                labelText: "Enter new caption",
                                                labelStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Nunito"),
                                                fillColor: Colors.black,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.blue,
                                                        )),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: const BorderSide(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.multiline,
                                              minLines: 1,
                                              maxLines: null,
                                            ),
                                          ),
                                        ),
                                        dismissOnBackKeyPress: true,
                                        isDense: false,
                                        btnOkText: "Confirm Caption",
                                        btnOkOnPress: () {})
                                    .show();
                              }),
                        ],
                        onPressed: () {},
                        child: ExpandableText(
                          "We will place the caption here",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          expandText: "show more",
                          collapseText: "show less",
                          maxLines: 2,
                          linkColor: Colors.orange,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Coments",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.purple),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return FocusedMenuHolder(
                            onPressed: () {},
                            menuWidth: MediaQuery.of(context).size.width * 0.50,
                            blurSize: 2.0,
                            menuItemExtent: 45,
                            menuBoxDecoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            duration: Duration(milliseconds: 100),
                            animateMenuItems: true,
                            blurBackgroundColor: Colors.black54,
                            // Open Focused-Menu on Tap rather than Long Press
                            menuOffset:
                                10.0, // Offset value to show menuItem from the selected item
                            bottomOffsetHeight:
                                80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                            menuItems: <FocusedMenuItem>[
                              // Add Each FocusedMenuItem  for Menu Options
                              FocusedMenuItem(
                                  title: Container(
                                    child: Text(
                                      "Copy",
                                      textScaleFactor: 1,
                                      style: GoogleFonts.nunito(
                                          color: Colors.black),
                                    ),
                                  ),
                                  trailingIcon: Icon(Icons.copy),
                                  onPressed: () async {}),
                              FocusedMenuItem(
                                  backgroundColor: Colors.red,
                                  title: Text(
                                    "Delete",
                                    textScaleFactor: 1,
                                    style:
                                        GoogleFonts.nunito(color: Colors.white),
                                  ),
                                  trailingIcon:
                                      Icon(Icons.delete, color: Colors.white),
                                  onPressed: () {})
                            ],

                            child: ListTileMoreCustomizable(
                              title: Text(
                                "@Rashid54",
                                textScaleFactor: 1,
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: Colors.cyan,
                                ),
                              ),
                              leading: GFAvatar(
                                backgroundColor: Colors.blue,
                                size: 25,
                              ),
                              horizontalTitleGap: 0.0,
                              minVerticalPadding: 10.0,
                              minLeadingWidth: 60,
                              contentPadding: EdgeInsets.all(0),
                              isThreeLine: false,
                              subtitle: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "This is my comment",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              trailing: Text(
                                " 1 min ago",
                                style: GoogleFonts.nunito(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              onTap: null,
                              onLongPress: null,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: null,
                      focusNode: null,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 3,
                      minLines: 1,
                      style: GoogleFonts.nunito(color: Colors.white),
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        hintText: "Start a conversation",
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: "Nunito"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(20),
                        filled: true,
                        fillColor: Colors.orange,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
