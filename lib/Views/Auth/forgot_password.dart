import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Interfaces/Auth/forgot_password_sevices.dart';

import '../widgets/Auth/auth_heading.dart';
import '../widgets/Auth/auth_text_field.dart';

class ForgotPassword extends StatelessWidget {
  final RoundedLoadingButtonController _forgotpasswordbtnController =
      RoundedLoadingButtonController();
  ForgotPasswordSevices forgotPasswordServicesServices = ForgotPasswordSevices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Tyamo",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              authHeading(
                mainText: "Forgot your password?",
                subText: "",
                logo: "assets/images/symbol.jpg",
                logoSize: 20.sp,
                fontSize: 16.sp,
              ),
              Container(
                  width: 40.w,
                  height: 20.h,
                  child: Image.asset(
                    "assets/images/forgotpassword.jpg",
                    filterQuality: FilterQuality.high,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                "To request for a new one, type your email address below. A link to reset the password will be sent to that email.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextField(
                controller: ForgotPasswordSevices().emailController,
                  Size: 14.sp,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                    width: 2000,
                    borderRadius: 10,
                    color: Colors.black,
                    controller: _forgotpasswordbtnController,
                    onPressed: () {},
                    child: Text(
                      "Send",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
