// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';
import 'package:library_management_application/service/librariandataservice.dart';
import 'package:library_management_application/user/components/booksdetailedrepo.dart';

class UserDetailsShow extends StatefulWidget {
  final int id;
  const UserDetailsShow({super.key, required this.id});

  @override
  State<UserDetailsShow> createState() => _UserDetailsShowState();
}

class _UserDetailsShowState extends State<UserDetailsShow> {
  MongoController mongoController = Get.put(MongoController());

  @override
  void initState() {
    super.initState();
    mongoController.getAllData();
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
          padding: const EdgeInsets.all(8),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/491892/details.svg',
            height: 12,
            width: 12,
          ),
        ),
        title: Text(
          "Book Detail",
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
              Get.toNamed("UserRequestPage");
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: sGreen,
            txt: "Request",
            txtcolor: sWhite,
          ),
          CustomButton(
            click: () {
              Get.toNamed("UserBottomNavBar");
            },
            height: screenSize.height * 0.06,
            width: screenSize.width * 0.4,
            boxcolor: sRed,
            txt: "Cancel",
            txtcolor: sWhite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.25,
              decoration: BoxDecoration(
                color: sWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: sBlack.withOpacity(0.1),
                  ),
                  left: BorderSide(
                    width: 2,
                    color: sBlack.withOpacity(0.1),
                  ),
                  right: BorderSide(
                    width: 2,
                    color: sBlack.withOpacity(0.1),
                  ),
                  bottom: BorderSide(
                    width: 2,
                    color: sBlack.withOpacity(0.1),
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mongoController.allData[widget.id]["authorname"].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: sBlack,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    mongoController.allData[widget.id]["bookname"].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: sOrange,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        'https://www.svgrepo.com/show/410907/publish.svg',
                        height: 16,
                        width: 16,
                        color: sBlack.withOpacity(0.6),
                      ),
                      const Gap(5),
                      Text(
                        mongoController.allData[widget.id]["publication"]
                            .toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: sBlack.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BooksDetailedRepo(
                  txt1: "Regulation",
                  txt2: mongoController.allData[widget.id]["regulation"]
                      .toString(),
                ),
                BooksDetailedRepo(
                  txt1: "Department",
                  txt2: mongoController.allData[widget.id]["relateddepartment"]
                      .toString(),
                ),
                BooksDetailedRepo(
                  txt1: "Availability",
                  txt2: mongoController.allData[widget.id]["availability"]
                      .toString(),
                ),
              ],
            ),
            const Gap(30),
            Text(
              "Books Detail's",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: sBlack,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Book Code: ${mongoController.allData[widget.id]["bookcode"].toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: sBlack.withOpacity(0.5),
                  ),
                ),
                Text(
                  '₹ ${mongoController.allData[widget.id]["bookprice"].toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: sOrange,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Librarian Name: ${mongoController.allData[widget.id]["librarianname"].toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: sBlack.withOpacity(0.5),
                  ),
                ),
                Text(
                  'Total Available: ${mongoController.allData[widget.id]["totalbooks"].toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: sBlack,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Text(
              mongoController.allData[widget.id]["collegename"].toString(),
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: sBlack,
              ),
            ),
            const Gap(30),
            Text(
              "Description",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: sBlack,
              ),
            ),
            Text(
              mongoController.allData[widget.id]["bookdescription"].toString(),
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: sBlack.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
