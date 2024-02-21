import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/types/authenticationtypebutton.dart';

class AuthenticationTypePage extends StatefulWidget {
  const AuthenticationTypePage({super.key});

  @override
  State<AuthenticationTypePage> createState() => _AuthenticationTypePageState();
}

class _AuthenticationTypePageState extends State<AuthenticationTypePage> {
  void updateSelectedUserType(String userType) {
    setState(() {
      selectedType = userType;
    });
  }

  String selectedType = '';
  void slectedUserTypeNavigation(String userType) {
    setState(() {
      selectedType = userType;
    });

    if (selectedType == 'Student') {
      Get.toNamed("UserBottomNavBar");
    } else if (selectedType == 'Librarian') {
      Get.toNamed("LibrarianBottomNavBar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sWhite,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shelfie",
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: sOrange,
                  ),
                ),
                const Gap(10),
                Text(
                  "Ditch the phone filters, snap a Shelfie with your latest literary love! Track your reads, share your stack, and discover gems in a vibrant community of bookworms!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: sBlack.withOpacity(0.3),
                  ),
                ),
                const Gap(30),
                Text(
                  "Please select your user type",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: sBlack.withOpacity(0.5),
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/363096/student-bold.svg',
                      logintxt: 'Student',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'Student',
                    ),
                    const Gap(30),
                    LogInTypeButton(
                      icnLink:
                          'https://www.svgrepo.com/show/497783/book-square.svg',
                      logintxt: 'Librarian',
                      onTap: (userType) async {
                        slectedUserTypeNavigation(userType);
                        HapticFeedback.lightImpact();
                      },
                      selected: selectedType == 'Librarian',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
