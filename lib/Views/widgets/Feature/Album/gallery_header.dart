import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class GalleryHeader extends StatelessWidget {
  final BuildContext context;
  final String tuVal;
  final String toVal;
  final bool isEditable;
  final String name;
  final String description;
  GalleryHeader({
    required this.context,
    required this.toVal,
    required this.description,
    required this.isEditable,
    required this.name,
    required this.tuVal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Color(0xffFafad2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            )
          ]),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.yellow],
                stops: [0.0, 0.5],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              color: Color(0xffFafad2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Gallery",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                ),
                CircularProfileAvatar("",
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    borderWidth: 1,
                    borderColor: Colors.purpleAccent,
                    elevation: 20.0,
                    errorWidget: (Context, urk, error) {
                      return const Icon(
                        Icons.face,
                        size: 20,
                      );
                    },
                    cacheImage: true,
                    onTap: () {
                      null;
                    },
                    animateFromOldImageOnUrlChange: true,
                    placeHolder: (context, url) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Colors.white),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400, color: Colors.black),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Uploads",
                        textScaleFactor: 1,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        tuVal,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ),
                isEditable
                    ? GestureDetector(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurple],
                        )),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.noHeader,
                      body: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Enter Album Description",
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Nunito"),
                                fillColor: Colors.black,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    ))),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                          ),
                        ),
                      ),
                      btnOkOnPress: () {},
                    ).show();
                  },
                )
                    : Container(),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Times Opend",
                        textScaleFactor: 1,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        toVal,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.deepOrangeAccent),
                      ),
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
