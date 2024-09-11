import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Views/Auth/login.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';
import 'package:tyamo/Views/widgets/Auth/splash_loader_animation.dart';

enum AuthStatus {
  firstTime,
  authenticating,
  notLoggedIn,
  loggedInHome,
  noProfile,
  noFriend,
}

class Root extends StatelessWidget {
  AuthStatus authStatus = AuthStatus.authenticating;

  @override
  Widget build(BuildContext context) {
    UserController userController =
        Provider.of<UserController>(context, listen: true);
    return FutureBuilder(
      future: null,
      builder: (context, snapshot) {
        if (userController.currentUser.uid == null) {
          authStatus = AuthStatus.notLoggedIn;
        }
        if (userController.currentUser.uid != null) {
          if (userController.currentUser.displayName == null) {
            authStatus = AuthStatus.noProfile;
          }
          if (userController.currentUser.displayName != null &&
              userController.currentUser.friendUid == null) {
            authStatus = AuthStatus.noFriend;
          }
          if (userController.currentUser.displayName != null &&
              userController.currentUser.friendUid != null) {
            authStatus = AuthStatus.loggedInHome;
          }
        }
        switch (authStatus) {
          case AuthStatus.authenticating:
            return SplashAnimator();
          case AuthStatus.noProfile:
            return ProfileSetup();
          case AuthStatus.noFriend:
            return InviteFriend();
          case AuthStatus.notLoggedIn:
            return Login();
          case AuthStatus.loggedInHome:
            return Homepage();
          case AuthStatus.firstTime:
            return Container();
          default:
            return SplashAnimator();
        }
      },
    );
  }
}
