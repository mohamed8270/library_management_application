import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/authentication/authenticationservice.dart';
import 'package:library_management_application/constants/categorycontainer.dart';
import 'package:library_management_application/constants/theme.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String img =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS671hX9LXk6ykl_P5vZzeGBUhKASSFzuD_1w&usqp=CAU';

  String icnlink = 'https://www.svgrepo.com/show/475656/google-color.svg';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.8,
                decoration: BoxDecoration(
                  color: sWhite,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                "Shelfie",
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Ditch the phone filters, snap a Shelfie with your latest literary love! Track your reads, share your stack, and discover gems in a vibrant community of bookworms",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: sBlack.withOpacity(0.3),
                  ),
                ),
              ),
              const Gap(30),
              CatergoryContainer(
                icnlink: icnlink,
                click: () {
                  AuthService().signInWithGoogle();
                },
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.5,
                color: sBlack.withOpacity(0.03),
                txt: "Login to continue",
                txtcolor: sBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
