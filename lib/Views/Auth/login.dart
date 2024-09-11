import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Views/Auth/forgot_password.dart';
import 'package:tyamo/Views/Auth/register.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';
import 'package:tyamo/Views/widgets/Auth/auth_text_field.dart';
import '../../Interfaces/Auth/login_services.dart';
import '../widgets/Auth/auth_heading.dart';

class Login extends StatelessWidget {
  final RoundedLoadingButtonController _loginbtnController =
      RoundedLoadingButtonController();
  LoginServices loginServices = LoginServices();
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
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              new authHeading(
                mainText: "Sign in to Tyamo",
                subText: "To connect with \n your partner",
                logo: "assets/images/symbol.jpg",
                logoSize: 20.sp,
                fontSize: 16.sp,
              ),
              const SizedBox(
                height: 50,
              ),
              AuthTextField(
                  controller: LoginServices().emailController,
                  Size: 14.sp,
                  icon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email",
                  obscureText: false),
              SizedBox(
                height: 20,
              ),
              AuthTextField(
                  controller: LoginServices().passController,
                  Size: 14.sp,
                  icon: Icons.password,
                  keyboardType: TextInputType.text,
                  labelText: "Password",
                  obscureText: true),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                    width: 2000,
                    borderRadius: 10,
                    controller: _loginbtnController,
                    color: Colors.black,
                    onPressed: () {
                      UserController().loginUser(
                        LoginServices().emailController.text,
                        LoginServices().passController.text,
                      );

                      // Timer(Duration(seconds: 3), () {
                      //   _loginbtnController.success();
                      //
                      //   Navigator.pushReplacement(
                      //     context,
                      //     PageTransition(
                      //       type: PageTransitionType.fade,
                      //       child: ProfileSetup(),
                      //     ),
                      //   );
                      // });
                    },
                    child: Text(
                      "Login",
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: ForgotPassword(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: const Color(0xffC1272D),
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                          child: Register(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up",
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
