import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "MY PROFILE",
            style: GoogleFonts.nunito(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dashboard/doodle.png"),
                  fit: BoxFit.fill),
            ),
            child: CircularProfileAvatar("",
                backgroundColor: Colors.cyan,
                borderWidth: 1,
                borderColor: Colors.deepPurpleAccent,
                elevation: 20,
                radius: 80,
                cacheImage: true,
                errorWidget: (context, url, error) {
                  return Icon(
                    Icons.face,
                    size: 50,
                  );
                },
                onTap: () {},
                animateFromOldImageOnUrlChange: true,
                placeHolder: (context, url) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rashid",
            style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "@Ra68",
            style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.purple),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Edit Profile Details",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.purple),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CardDetailRow(
                    icon: Icon(Icons.alternate_email),
                    type: "Email",
                    val: "rashid@tyamo.com",
                    clr: Colors.grey.shade200),
                CardDetailRow(
                    icon: Icon(Icons.outlined_flag),
                    type: "Country",
                    val: "Pakistan",
                    clr: Colors.transparent),
                CardDetailRow(
                    icon: Icon(Icons.phone),
                    type: "Phone Number",
                    val: "Not Currently Set",
                    clr: Colors.grey.shade200),
                more
                    ? CardDetailRow(
                        icon: Icon(FontAwesomeIcons.venusMars),
                        type: "Gender",
                        val: "Male",
                        clr: Colors.transparent)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.person_outline),
                        type: "Partner",
                        val: "ALi",
                        clr: Colors.grey.shade200)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.fingerprint),
                        type: "UID",
                        val: "sjsu39bvf89f9ruvhr7vnu",
                        clr: Colors.transparent)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.schedule),
                        type: "Account Created",
                        val: "20-01-2024",
                        clr: Colors.grey.shade200)
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.grey.shade200),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            onPressed: () {
              setState(() {
                more = !more;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                more ? "-Show Less " : "+ Show More",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xffff9966),
                      Color(0xffff5e62),
                    ]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Subscribed to",
                      style: GoogleFonts.nunito(color: Colors.white),
                    ),
                    Text(
                      "Premium",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(

                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Subscribed on",
                        style: GoogleFonts.nunito(color: Colors.white),
                      ),
                      Text(
                        "N/A",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}

class CardDetailRow extends StatelessWidget {
  CardDetailRow({
    required this.icon,
    required this.type,
    required this.val,
    required this.clr,
  });
  final String type;
  final Icon icon;
  final String val;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              type,
              textScaleFactor: 1,
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(),
            ),
            Flexible(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  val,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: val == "Not Currently Set"
                          ? Colors.red
                          : Colors.black),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
