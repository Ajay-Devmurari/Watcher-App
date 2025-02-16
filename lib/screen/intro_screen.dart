import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watcher_app/screen/intro_screen2.dart';
import 'package:watcher_app/utils/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 1000),
          type: PageTransitionType.sharedAxisHorizontal,
          child: const IntroScreen2(),
        ),
      );
    });
  }

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
        child: Center(
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
                'Watcher',
                style: GoogleFonts.nunito(
                    fontSize: ht * 0.08,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.textWhiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
