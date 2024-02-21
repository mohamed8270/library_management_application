// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/interface/custombutton.dart';
import 'package:library_management_application/service/studentdatarequest.dart';
import 'package:library_management_application/user/components/bookrequestinput.dart';
import 'package:uuid/uuid.dart';

class UserRequestPage extends StatefulWidget {
  const UserRequestPage({super.key});

  @override
  State<UserRequestPage> createState() => _UserRequestPageState();
}

class _UserRequestPageState extends State<UserRequestPage> {
  TextEditingController stunameController = TextEditingController();
  TextEditingController studepartController = TextEditingController();
  TextEditingController stuyearController = TextEditingController();
  TextEditingController stucollegeController = TextEditingController();
  TextEditingController sturegnumberController = TextEditingController();
  TextEditingController stuwhatsappController = TextEditingController();
  TextEditingController stubooknameController = TextEditingController();
  TextEditingController stubookcodeController = TextEditingController();
  TextEditingController stubookpubController = TextEditingController();
  TextEditingController stubookfromdateController = TextEditingController();
  TextEditingController stubooktodateController = TextEditingController();

  StudentBookRequest studentBookRequest = Get.put(StudentBookRequest());

  DateTime? selectedFromDate;
  DateTime? selectedToDate;

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedFromDate) {
      setState(() {
        selectedFromDate = picked;
        stubookfromdateController.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
        stubooktodateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> submitData() async {
    try {
      final uuid = Uuid();
      final studentRequestData = {
        '_id': uuid.v4(),
        'studentname': stunameController.text,
        'studentdepartment': studepartController.text,
        'studentyear': stuyearController.text,
        'studentcollege': stucollegeController.text,
        'studentregister': sturegnumberController.text,
        'studentwhatsapp': stuwhatsappController.text,
        'studentbookname': stubooknameController.text,
        'studentbookcode': stubookcodeController.text,
        'studentbookpublication': stubookpubController.text,
        'studentbookfromdate': stubookfromdateController.text,
        'studentbooktodate': stubooktodateController.text,
      };

      await studentBookRequest.pushStudentData(studentRequestData);
      Get.toNamed('UserBottomNavBar');
    } catch (e) {
      throw Exception('Error while submitting data: $e');
    }
  }

  @override
  void dispose() {
    studentBookRequest.onClose();
    super.dispose();
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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.network(
              'https://www.svgrepo.com/show/327609/arrow-back.svg',
              height: 12,
              width: 12,
            ),
          ),
        ),
        title: Text(
          "Apply",
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
        txt: "Apply",
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
                "Student Detail's",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: sOrange,
                ),
              ),
              const Gap(10),
              BookRequestInput(
                userController: stunameController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/532397/user-shield-alt-1.svg',
                txt: 'Student Name',
                type: TextInputType.name,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookRequestInput(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/318100/shopping-cash-register.svg',
                    txt: 'Register Number',
                    type: TextInputType.number,
                    userController: sturegnumberController,
                  ),
                  BookRequestInput(
                    userController: stuyearController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/345301/calendar-year-month-date-schedule-page-plan.svg',
                    txt: 'Year',
                    type: TextInputType.number,
                  ),
                ],
              ),
              const Gap(10),
              BookRequestInput(
                userController: studepartController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink:
                    'https://www.svgrepo.com/show/474442/department-resources.svg',
                txt: 'Student Department',
                type: TextInputType.text,
              ),
              const Gap(10),
              BookRequestInput(
                userController: stucollegeController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/524499/diploma.svg',
                txt: 'Student College',
                type: TextInputType.text,
              ),
              const Gap(10),
              BookRequestInput(
                userController: stuwhatsappController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/360940/whatsapp.svg',
                txt: 'Student WhatsApp',
                type: TextInputType.number,
              ),
              const Gap(10),
              BookRequestInput(
                userController: stubooknameController,
                height: screenSize.height * 0.055,
                width: screenSize.width * 0.95,
                icnLink: 'https://www.svgrepo.com/show/523207/book.svg',
                txt: 'Book Name',
                type: TextInputType.text,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BookRequestInput(
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink:
                        'https://www.svgrepo.com/show/533329/code-merge.svg',
                    txt: 'Book Code',
                    type: TextInputType.text,
                    userController: stubookcodeController,
                  ),
                  BookRequestInput(
                    userController: stubookpubController,
                    height: screenSize.height * 0.055,
                    width: screenSize.width * 0.47,
                    icnLink: 'https://www.svgrepo.com/show/410907/publish.svg',
                    txt: 'Book Publication',
                    type: TextInputType.text,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _selectFromDate(context),
                    child: AbsorbPointer(
                      child: BookRequestInput(
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.47,
                        icnLink:
                            'https://www.svgrepo.com/show/457647/date-range.svg',
                        txt: 'From Date',
                        type: TextInputType.datetime,
                        userController: stubookfromdateController,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectToDate(context),
                    child: AbsorbPointer(
                      child: BookRequestInput(
                        userController: stubooktodateController,
                        height: screenSize.height * 0.055,
                        width: screenSize.width * 0.47,
                        icnLink:
                            'https://www.svgrepo.com/show/457647/date-range.svg',
                        txt: 'To Date',
                        type: TextInputType.datetime,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
