import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Views/Features/Album/album_post.dart';

import '../../widgets/Feature/Album/gallery_header.dart';

class MyAlbum extends StatelessWidget {
  const MyAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GalleryHeader(
            context: context,
            isEditable: true,
            toVal: "0",
            tuVal: "0",
            name: "Rashid's Gallery",
            description: "Tell Your Partner What This Album Means To You !",
          ),
          Container(
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              crossAxisCount: 4,
              itemCount: 6,
              itemBuilder: (context, index) {
                return FocusedMenuHolder(
                  menuWidth: MediaQuery.of(context).size.width * 0.50,
                  blurSize: 2.0,
                  menuItemExtent: 45,
                  menuBoxDecoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                        title: Text("Open"),
                        trailingIcon: Icon(Icons.open_in_new),
                        onPressed: () {}),

                    FocusedMenuItem(
                        backgroundColor: Colors.red,
                        title: Text(
                          "Delete",
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Nunito"),
                        ),
                        trailingIcon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ],
                  onPressed: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: AlbumPost()),
                        );
                      },
                      child: Hero(
                        tag: "assets/images/gallery.jpg",
                        child: Image.asset(
                          "assets/images/gallery.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 3),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 15.0,
            ),
          )
        ],
      ),
    );
  }
}
