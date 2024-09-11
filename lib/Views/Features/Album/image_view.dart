import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ImageView extends StatelessWidget {

String url;
ImageView({required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: "assets/images/gallery.jpg"),
        imageProvider: AssetImage("assets/images/gallery.jpg"),
      ),
    );
  }
}
