import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watcher_app/screen/login_screen.dart';
import 'package:watcher_app/widget/textbox.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../utils/colors.dart';
import '../widget/intro_button.dart';
import '../widget/nav_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    super.key,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

bool isChecked = false;

class _SignupScreenState extends State<SignupScreen> {
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
              SvgPicture.asset('assets/intro_logo.svg',
                  fit: BoxFit.cover, color: Colors.white),
              Text(
                'Create an account',
                style: GoogleFonts.aBeeZee(
                  fontSize: ht * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: ht * 0.02,
              ),
              const CustomTextBox(
                text: 'Username',
                icon: Icon(
                  FontAwesome.user,
                ),
              ),
              const CustomTextBox(
                text: 'Email address',
                icon: Icon(EvaIcons.email_outline),
              ),
              const CustomTextBox(
                text: 'Password(8+character)',
                icon: Icon(BoxIcons.bx_lock),
              ),
              CustomButton(
                text: 'Sign Up',
                onClick: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      curve: Easing.standard,
                      duration: const Duration(milliseconds: 800),
                      alignment: Alignment.center,
                      type: PageTransitionType.sharedAxisVertical,
                      child: const CustomNavbar(),
                    ),
                  );
                },
                color: const Color(0xE72D90F1),
                fontColor: CustomColors.textWhiteColor,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Text(
                    'Accept terms and condition',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                  Text("Already have an account",
                      style: GoogleFonts.aBeeZee(color: Colors.white)),
                  TextButton(
                      onPressed: () {
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
                      child: Text('Log In',
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
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or continue With',
            style: GoogleFonts.aBeeZee(color: Colors.grey[500]),
          ),
        ),
        const Expanded(child: Divider())
      ],
    );
  }

  Widget buildCustomIcon() {
    Widget icons(String svgIcon) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 60, 58, 58),
        ),
        height: 40,
        width: 50,
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
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
