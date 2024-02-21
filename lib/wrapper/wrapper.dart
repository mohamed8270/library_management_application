import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_application/authentication/loginpage.dart';
import 'package:library_management_application/constants/splashpage.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/librarianbottomnavbar.dart';
import 'package:library_management_application/interface/userbottomnavbar.dart';
import 'package:library_management_application/librarian/pages/librarianaccountspage.dart';
import 'package:library_management_application/librarian/pages/librarianhomepage.dart';
import 'package:library_management_application/librarian/pages/librarianpostpage.dart';
import 'package:library_management_application/main.dart';
import 'package:library_management_application/onboarding/onboardingpages.dart';
import 'package:library_management_application/types/authenticationtypepage.dart';
import 'package:library_management_application/user/components/userrequestpage.dart';
import 'package:library_management_application/user/pages/useraccountpage.dart';
import 'package:library_management_application/user/pages/userhomepage.dart';
import 'package:library_management_application/user/pages/userviewpage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shelfie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: sOrange),
        useMaterial3: true,
      ),
      routes: {
        "UserHomePage": (c) => const UserHomePage(),
        "UserViewPage": (c) => const UserViewPage(),
        "UserAccountPage": (c) => const UserAccoountPage(),
        "UserBottomNavBar": (c) => const UserBottomNavBar(),
        "UserRequestPage": (c) => const UserRequestPage(),
        "LibrarianBottomNavBar": (c) => const LibrarianBottomNavBar(),
        "LibrarianHomepage": (c) => const LibrarianHomePage(),
        "LibrarianPostPage": (c) => const LibrarianPostPage(),
        "LibrarianAccountPage": (c) => const LibraraianAccountPage(),
        "LoginPage": (c) => const LogInPage(),
        "AuthenticationTypePage": (c) => const AuthenticationTypePage(),
        "SplashPage": (c) => const SplashPage(),
        "OnBoardingPage": (c) => const OnBoardingScreen(),
      },
      home: isviewed != 0 ? const OnBoardingScreen() : const SplashPage(),
    );
  }
}
