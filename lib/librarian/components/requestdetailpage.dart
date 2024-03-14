// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';
import 'package:library_management_application/service/studentdatarequest.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestDetailsProcessPage extends StatefulWidget {
  final int id;
  const RequestDetailsProcessPage({super.key, required this.id});

  @override
  State<RequestDetailsProcessPage> createState() =>
      _RequestDetailsProcessPageState();
}

class _RequestDetailsProcessPageState extends State<RequestDetailsProcessPage> {
  StudentBookRequest studentBookRequest = Get.put(StudentBookRequest());

  openwhatsapp() async {
    // var whatsapp = "";
    var message =
        '${studentBookRequest.allData[widget.id]["studentbookname"].toString()}\n${studentBookRequest.allData[widget.id]["studentbookcode"].toString()}\n${studentBookRequest.allData[widget.id]["studentbookpublication"].toString()}\nBooks are available for your request \n\n*Fine amount will be charged, If the due date is exceeded*';
    var studentNumber =
        '+91${studentBookRequest.allData[widget.id]["studentwhatsapp"].toString()}';
    var whatsappurlAndroid =
        "whatsapp://send?phone=$studentNumber&text=${Uri.encodeFull(message)}";
    var whatappurlIos =
        "https://wa.me/$studentNumber?text=${Uri.encodeFull(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappurlIos)) {
        await launch(whatappurlIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: sBlack.withOpacity(0.02),
            content: Text(
              "whatsapp no installed",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: sBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      }
    } else {
      // android , web
      if (await canLaunch(whatsappurlAndroid)) {
        await launch(whatsappurlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: sBlack.withOpacity(0.02),
            content: Text(
              "whatsapp no installed",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: sBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    studentBookRequest.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: sWhite,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/491892/details.svg',
            height: 12,
            width: 12,
            color: sOrange,
          ),
        ),
        title: Text(
          "Request Detail's",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: sBlack,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            click: () {
              openwhatsapp();
              Get.toNamed("LibrarianBottomNavBar");
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: sGreen,
            txt: "Approve",
            txtcolor: sWhite,
          ),
          CustomButton(
            click: () {
              Get.toNamed("LibrarianBottomNavBar");
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: sRed,
            txt: "Cancel",
            txtcolor: sWhite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Requirement",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: sBlack,
                ),
              ),
              const Gap(10),
              Text(
                studentBookRequest.allData[widget.id]["studentname"].toString(),
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: sBlack.withOpacity(0.5),
                ),
              ),
              const Gap(5),
              Text(
                studentBookRequest.allData[widget.id]["studentbookname"]
                    .toString(),
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Book Code: ${studentBookRequest.allData[widget.id]["studentbookcode"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: sBlack,
                    ),
                  ),
                  Text(
                    'Author Name: ${studentBookRequest.allData[widget.id]["studentbookpublication"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: sBlack,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'From Date: ${studentBookRequest.allData[widget.id]["studentbookfromdate"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: sBlack,
                    ),
                  ),
                  Text(
                    'To Date: ${studentBookRequest.allData[widget.id]["studentbooktodate"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: sBlack,
                    ),
                  ),
                ],
              ),
              const Gap(40),
              Text(
                "Student Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: sBlack,
                ),
              ),
              const Gap(10),
              Text(
                'Student Name: ${studentBookRequest.allData[widget.id]["studentname"].toString()}',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              Text(
                'Register No. ${studentBookRequest.allData[widget.id]["studentregister"].toString()}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: sBlack,
                ),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Department: ${studentBookRequest.allData[widget.id]["studentdepartment"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: sBlack.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'Year: ${studentBookRequest.allData[widget.id]["studentyear"].toString()}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: sBlack.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                studentBookRequest.allData[widget.id]["studentcollege"]
                    .toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: sBlack.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
