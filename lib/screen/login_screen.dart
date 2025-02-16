import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watcher_app/screen/signup_screen.dart';
import 'package:watcher_app/utils/colors.dart';
import 'package:watcher_app/widget/nav_bar.dart';
import '../widget/intro_button.dart';
import '../widget/textbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.red],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/intro_logo.svg',
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              Text(
                'Login',
                style: GoogleFonts.aBeeZee(
                    fontSize: ht * 0.03,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.textWhiteColor),
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              const CustomTextBox(
                text: 'Email address',
                icon: Icon(EvaIcons.email_outline),
              ),
              const CustomTextBox(
                text: 'Password',
                icon: Icon(BoxIcons.bx_lock),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password",
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
              ),
              CustomButton(
                text: 'Log In',
                onClick: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 800),
                      type: PageTransitionType.sharedAxisVertical,
                      child: const CustomNavbar(),
                    ),
                  );
                },
                color: const Color(0xE72D90F1),
                fontColor: Colors.white,
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              textWithDivider(),
              SizedBox(
                height: ht * 0.02,
              ),
              buildCustomIcon(),
              SizedBox(
                height: ht * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account",
                      style: GoogleFonts.aBeeZee(color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 800),
                            type: PageTransitionType.sharedAxisVertical,
                            child: const SignupScreen(),
                          ),
                        );
                      },
                      child: Text('Sign Up',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xE72D90F1))))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWithDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
            child: Divider(
          color: Colors.white70,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('Or continue With',
              style: GoogleFonts.aBeeZee(color: Colors.grey[400])),
        ),
        const Expanded(
            child: Divider(
          color: Colors.white70,
        ))
      ],
    );
  }

  Widget buildCustomIcon() {
    Widget icons(String svgIcon) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF292D3E),
        ),
        height: 50,
        width: 50,
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icons('assets/google_icon.svg'),
        icons('assets/apple_icon.svg'),
        icons('assets/facebook_icon.svg')
      ],
    );
  }
}
