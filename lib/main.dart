import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import  'package:tyamo/Views/Auth/forgot_password.dart';
import 'package:tyamo/Views/Features/Album/album_main.dart';
import 'package:tyamo/Views/Features/Album/album_new_post.dart';
import 'package:tyamo/Views/Features/Album/album_post.dart';
import 'package:tyamo/Views/Features/Album/friend_album.dart';
import 'package:tyamo/Views/Features/Album/my_album.dart';
import 'package:tyamo/Views/Features/BatteryInfo/UserStatus/user_status.dart';
import 'package:tyamo/Views/Features/BatteryInfo/battery_info.dart';
import 'package:tyamo/Views/Features/DeviceInfo/device_info.dart';
import 'package:tyamo/Views/Features/DeviceSpecs/device_specs.dart';
import 'package:tyamo/Views/Features/Locationinfo/location_info.dart';
import 'package:tyamo/Views/Homepage/dashboard.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';
import 'package:tyamo/Views/Invitation/accept_invitation.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Profile/profile_settings.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';

import 'Views/Auth/login.dart';
import 'Views/Auth/register.dart';
import 'Views/widgets/Auth/splash.dart';
import 'Views/widgets/Auth/splash_loader_animation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Tyamo());
}

class Tyamo extends StatelessWidget {
  const Tyamo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserController(),
        )
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false, title: 'Tyamo', home: Register ());
      }),
    );
  }
}
