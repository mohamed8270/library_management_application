// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/service/librariandataservice.dart';
import 'package:library_management_application/user/components/userdetailshow.dart';

class UserViewPage extends StatefulWidget {
  const UserViewPage({super.key});

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
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
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Got you!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: sBlack,
                ),
              ),
              Text(
                "Get your required book at your palm, The most valuable app for the college students is here!",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: sBlack.withOpacity(0.35),
                ),
              ),
              const Gap(20),
              Text(
                "Book Available",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: sBlack,
                ),
              ),
              const Gap(20),
              SizedBox(
                height: screenSize.height * 0.15,
                width: screenSize.width * 0.95,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mongoController.allData.length,
                  itemBuilder: (context, index) {
                    final document = mongoController.allData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            UserDetailsShow(
                              id: index,
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: screenSize.height * 0.15,
                          width: screenSize.width * 0.8,
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
                                  document["authorname"].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: sBlack.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.45,
                                  child: Text(
                                    document["bookname"].toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: sOrange,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.45,
                                  child: Text(
                                    document["bookdescription"].toString(),
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
                                  document["regulation"].toString(),
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
