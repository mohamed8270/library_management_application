import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/authentication/authenticationservice.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';

class UserAccoountPage extends StatefulWidget {
  const UserAccoountPage({super.key});

  @override
  State<UserAccoountPage> createState() => _UserAccoountPageState();
}

class _UserAccoountPageState extends State<UserAccoountPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: sBlack.withOpacity(0.03),
                child: ClipOval(
                  child: Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: sBlack.withOpacity(0.5),
                ),
              ),
              const Gap(20),
              CustomButton(
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.4,
                boxcolor: sOrange,
                txt: 'SignOut',
                txtcolor: sWhite,
                click: () {
                  AuthService().signOut();
                  Get.toNamed("LoginPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
