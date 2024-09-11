import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Interfaces/Auth/register_services.dart';
import 'package:tyamo/Views/Auth/login.dart';

import '../widgets/Auth/auth_heading.dart';
import '../widgets/Auth/auth_text_field.dart';

class Register extends StatelessWidget {
  final RoundedLoadingButtonController _registerBtnController =
      RoundedLoadingButtonController();
  final RegisterServices registerServices = RegisterServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tyamo",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              new authHeading(
                mainText: "Sign Up to Tyamo",
                subText: "Get connected with \n your partner",
                logo: "assets/images/symbol.jpg",
                logoSize: 20.sp,
                fontSize: 16.sp,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                  controller: RegisterServices().emailController,
                  Size: 14.sp,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                  controller: RegisterServices().passController,
                  Size: 14.sp,
                  icon: Icons.password,
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                  controller: RegisterServices().confirmPassController,
                  Size: 14.sp,
                  icon: Icons.lock_reset,
                  keyboardType: TextInputType.text,
                  labelText: "Confirm Password",
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                    width: 2000,
                    borderRadius: 10,
                    controller: _registerBtnController,
                    color: Color(0xff00c1AA),
                    onPressed: () {
                      if (registerServices.passController.text ==
                          registerServices.confirmPassController.text) {
                        UserController().registerUser(
                            registerServices.emailController.text,
                            registerServices.passController.text);
                      } else {
                        AchievementView(
                            title: "Error!",
                            subTitle: "not match",
                            color: Colors.red,
                            listener: (status) {
                              print(status);
                            }).show(context);
                      }
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "By registering, you agree to our terms and conditions",
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Registered?",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      color: const Color(0xff5A5B5B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Login(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: const Color(0xff2F76EA),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
