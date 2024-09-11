import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Model/my_user.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/widgets/Auth/auth_text_field.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';

class ProfileSetup extends StatefulWidget {
  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final RoundedLoadingButtonController _profileSetupbtnController =
      RoundedLoadingButtonController();

  bool isMale = true;
  File? file;
  bool isUploading = false;
  ImagePicker img = ImagePicker();
  String postId = Uuid().v4();

  handleChooseFromGallery() async {
    var getImage = await img.pickImage(
        source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1920);
    File io = File(getImage!.path);
    setState(() {
      file = io;
    });
    if (file != null) {
      uploadToStorage();
    }
  }

  updateAvatarInFirestore({String? mediaUrl, String? uid}) async {
    print(uid);
    print(mediaUrl);
    await FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .update({"avatarUrl": mediaUrl});
  }

  uploadToStorage() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String? mediaUrl = await uploadImage();
    print("the media url : $mediaUrl");

    if (mediaUrl != null) {
      await updateAvatarInFirestore(mediaUrl: mediaUrl, uid: myUser!.uid);
    }
  }

  Future<String?> uploadImage() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("ProfilePictures/$postId.jpg")
        .putFile(file!);
    String? downloadUrl;
    return uploadTask.then((p0) => p0.ref.getDownloadURL());
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? imageFile = Im.decodeImage(file!.readAsBytesSync());
    final compressedImageFile = File("$path/image_$postId.jpg")
      ..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 90));
    setState(() {
      file = compressedImageFile;
    });
  }

  UserController? _currentUser;
  MyUser? myUser;
  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserController>(context, listen: false);
    setState(() {
      myUser = _currentUser!.getCurrentUser;
    });

    return Scaffold(
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
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                "Profile Setup",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CircularProfileAvatar(
              "https://www.shutterstock.com/image-photo/awesome-pic-natureza-260nw-2408133899.jpg",
              onTap: () {
                handleChooseFromGallery();
              },
              backgroundColor: Colors.cyan,
              initialsText: Text("+",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthTextField(
                  controller: TextEditingController(),
                  Size: 16,
                  icon: Icons.face,
                  keyboardType: TextInputType.text,
                  labelText: "Your name",
                  obscureText: false),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthTextField(
                  controller: TextEditingController(),
                  Size: 16,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.text,
                  labelText: "Your username",
                  obscureText: false),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: isMale ? Colors.cyan : Colors.grey,
                        shape: BoxShape.circle,
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1.0, 9.0),
                              blurRadius: 30)
                        ]),
                    child: const Icon(
                      Icons.male,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: !isMale ? Colors.purple : Colors.grey,
                        shape: BoxShape.circle,
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1.0, 9.0),
                              blurRadius: 30)
                        ]),
                    child: const Icon(
                      Icons.female,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                    width: 200,
                    borderRadius: 10,
                    controller: _profileSetupbtnController,
                    color: Colors.cyan,
                    onPressed: () {
                      Timer(Duration(seconds: 3), () {
                        _profileSetupbtnController.success();

                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: InviteFriend(),
                          ),
                        );
                      });
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
