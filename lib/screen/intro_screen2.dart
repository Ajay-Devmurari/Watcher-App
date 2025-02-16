import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watcher_app/screen/login_screen.dart';
import 'package:watcher_app/screen/signup_screen.dart';
import 'package:watcher_app/utils/colors.dart';
import 'package:watcher_app/widget/intro_button.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/intro_image.svg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/intro_logo.svg',
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              Text(
                'Watcher',
                style: GoogleFonts.nunito(
                    fontSize: ht * 0.04,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.textWhiteColor),
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              Text(
                textAlign: TextAlign.center,
                'Your Ticket to Screen Satisfaction\nRate, Review, Reel in the Best!',
                style: GoogleFonts.roboto(
                    fontSize: ht * 0.02, color: CustomColors.textWhiteColor),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButton(
                  text: 'Sign Up',
                  onClick: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Easing.standard,
                        duration: const Duration(milliseconds: 800),
                        alignment: Alignment.center,
                        type: PageTransitionType.sharedAxisVertical,
                        child: const SignupScreen(),
                      ),
                    );
                  },
                  color: const Color(0xE72D90F1),
                  fontColor: CustomColors.textWhiteColor,
                ),
              ),
              CustomButton(
                text: 'I have already an account',
                onClick: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      curve: Easing.standard,
                      duration: const Duration(milliseconds: 800),
                      alignment: Alignment.center,
                      type: PageTransitionType.sharedAxisVertical,
                      child: const LoginScreen(),
                    ),
                  );
                },
                color: CustomColors.textTransparentColor,
                fontColor: CustomColors.textWhiteColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
