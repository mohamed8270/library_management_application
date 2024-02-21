// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/service/studentdatarequest.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  StudentBookRequest studentBookRequest = Get.put(StudentBookRequest());

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
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/529405/book-2.svg',
            height: 12,
            width: 12,
            color: sBlack.withOpacity(0.3),
          ),
        ),
        title: Text(
          "Shelfie",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: sOrange,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: sBlack,
                ),
              ),
              Text(
                "The first ever library management application at your palm, make use of it!",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: sBlack.withOpacity(0.35),
                ),
              ),
              const Gap(20),
              Text(
                "Books Requested",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: sBlack,
                ),
              ),
              const Gap(10),
              SizedBox(
                height: screenSize.height * 0.15,
                width: screenSize.width * 0.95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: studentBookRequest.allData.length,
                  itemBuilder: (context, index) {
                    final document = studentBookRequest.allData[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onLongPress: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: screenSize.height * 0.15,
                          width: screenSize.width * 0.5,
                          decoration: BoxDecoration(
                            color: sBlack.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document["studentname"].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: sBlack.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.45,
                                  child: Text(
                                    document["studentbookname"].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: sOrange,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.45,
                                  child: Text(
                                    document["studentbookcode"].toString(),
                                    overflow: TextOverflow.visible,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: sBlack.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  document["studentbookpublication"].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: sBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
