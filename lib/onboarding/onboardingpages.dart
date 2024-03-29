// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/authentication/authenticationservice.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';
import 'package:library_management_application/onboarding/onboardingcontent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int CurrentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    // ignore: avoid_print
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // ignore: avoid_print
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: sWhite,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  CurrentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
                  child: Column(
                    children: [
                      Container(
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          image: NetworkImage(content[i].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(30),
                      Text(
                        content[i].title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: sBlack,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        content[i].description,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: sBlack.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                content.length,
                (index) => builddot(index, context),
              ),
            ),
          ),
          const Gap(30),
          CustomButton(
            height: screenSize.height * 0.05,
            width: screenSize.width * 0.8,
            boxcolor: sOrange,
            txt: CurrentIndex == content.length - 1 ? "Continue" : "Next",
            txtcolor: sWhite,
            click: () async {
              if (CurrentIndex == content.length - 1) {
                await _storeOnboardInfo();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AuthService().handleAuthState(),
                  ),
                );
              }
              _controller?.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
          ),
          const Gap(40),
        ],
      ),
    );
  }

  Container builddot(int index, BuildContext context) {
    return Container(
      height: 5,
      width: CurrentIndex == index ? 15 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CurrentIndex == index ? sOrange : sBlack.withOpacity(0.3),
      ),
    );
  }
}
