import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumNewPost extends StatelessWidget {
  const AlbumNewPost({super.key});

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
      body: ListView(
        children: [
          Container(),
          Container(
            height: 300.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/gallery.jpg"))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Write a caption....",border: InputBorder.none,

                ),
                onChanged: (value){},
              ),
            ),
          ),
          Divider(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 150.0,vertical: 50.0),child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),

              ))
            ),
            onPressed: (){},
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("POST PICTURE",style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,fontSize: 15
              ),),
            ),
          ),)

        ],
      ),
    );
  }
}
