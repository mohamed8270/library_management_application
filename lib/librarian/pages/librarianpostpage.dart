// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';
import 'package:library_management_application/librarian/components/bookinputwidget.dart';
import 'package:library_management_application/service/librariandataservice.dart';
import 'package:uuid/uuid.dart';

class LibrarianPostPage extends StatefulWidget {
  const LibrarianPostPage({super.key});

  @override
  State<LibrarianPostPage> createState() => _LibrarianPostPageState();
}

class _LibrarianPostPageState extends State<LibrarianPostPage> {
  TextEditingController libnameController = TextEditingController();
  TextEditingController pubController = TextEditingController();
  TextEditingController booknameController = TextEditingController();
  TextEditingController booknumController = TextEditingController();
  TextEditingController bookavaiController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController bookdepartController = TextEditingController();
  TextEditingController totalavaiController = TextEditingController();
  TextEditingController bookpriceController = TextEditingController();
  TextEditingController bookdesController = TextEditingController();

  MongoController mongoController = Get.put(MongoController());

  Future<void> submitData() async {
    try {
      final uuid = Uuid();
      final libraryBooksData = {
        '_id': uuid.v4(),
        'bookname': booknameController.text,
        'authorname': authorController.text,
        'regulation': yearController.text,
        'relateddepartment': bookdepartController.text,
        'availability': bookavaiController.text,
        'publication': pubController.text,
        'bookcode': booknumController.text,
        'bookprice': bookpriceController.text,
        'bookdescription': bookdesController.text,
        'librarianname': libnameController.text,
        'collegename': collegeController.text,
        'totalbooks': totalavaiController.text,
      };

      await mongoController.pushData(libraryBooksData);
      Get.toNamed('LibrarianHomepage');
    } catch (e) {
      throw Exception('Error while submitting data: $e');
    }
  }

  @override
  void dispose() {
    mongoController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: sWhite,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/229807/library-book.svg',
            height: 12,
            width: 12,
          ),
        ),
        title: Text(
          "Post Book",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: sBlack,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        click: () => submitData(),
        height: screenSize.height * 0.06,
        width: screenSize.width * 0.9,
        boxcolor: sOrange,
        txt: "Submit",
        txtcolor: sWhite,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              BookInputWidget(
                userController: booknameController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/529405/book-2.svg',
                txt: 'Book Name',
                type: TextInputType.name,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink: 'https://www.svgrepo.com/show/505801/user-1.svg',
                    txt: 'Author Name',
                    type: TextInputType.name,
                    userController: authorController,
                  ),
                  BookInputWidget(
                    userController: yearController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/533381/calendar-alt.svg',
                    txt: 'Regulation Year',
                    type: TextInputType.number,
                  ),
                ],
              ),
              const Gap(10),
              BookInputWidget(
                userController: bookdepartController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/430897/department.svg',
                txt: 'Related Department',
                type: TextInputType.name,
              ),
              const Gap(10),
              BookInputWidget(
                userController: bookavaiController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/506579/sort-numeric-alt-up.svg',
                txt: 'Books Available',
                type: TextInputType.name,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookInputWidget(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/512733/profile-round-1346.svg',
                    txt: 'Publication Name',
                    type: TextInputType.name,
                    userController: pubController,
                  ),
                  BookInputWidget(
                    userController: booknumController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/533329/code-merge.svg',
                    txt: 'Book Code',
                    type: TextInputType.number,
                  ),
                ],
              ),
              const Gap(10),
              BookInputWidget(
                userController: bookpriceController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/523557/money-bag.svg',
                txt: 'Book Price',
                type: TextInputType.number,
              ),
              const Gap(10),
              BookInputWidget(
                userController: bookdesController,
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/487268/description.svg',
                txt: 'Book Description',
                type: TextInputType.text,
              ),
              const Gap(30),
              Text(
                "Librarian Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              BookInputWidget(
                userController: libnameController,
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/449319/user-admin.svg',
                txt: 'Librarian Name',
                type: TextInputType.name,
              ),
              const Gap(10),
              BookInputWidget(
                userController: collegeController,
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/529915/square-academic-cap.svg',
                txt: 'College Name',
                type: TextInputType.name,
              ),
              const Gap(10),
              BookInputWidget(
                userController: totalavaiController,
                height: screenSize.height * 0.1,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/529405/book-2.svg',
                txt: 'Total Available Books',
                type: TextInputType.number,
              ),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
