// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:mongo_dart/mongo_dart.dart';

class StudentBookRequest extends GetxController {
  late Db _db;
  late DbCollection _studentbookrequest;

  @override
  void onInit() {
    super.onInit();
    _connectToMongo();
  }

  // All the Function Below are User Side Rendering
  Future<void> _connectToMongo() async {
    final url = dotenv.env['MONGO_URL'].toString();
    _db = await Db.create(url); // Replace with your MongoDB URI
    await _db.open();

    // Replace with your collection name
    _studentbookrequest = _db.collection("student_book_request");
  }

  // All the Function are Technician Side Rendering
  Future<void> pushStudentData(Map<String, dynamic> data) async {
    try {
      await _studentbookrequest.insert(data);
      Get.snackbar(
        "Success",
        "Data pushed to MongoDB successfully",
        backgroundColor: sGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: sWhite,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to push data: $e",
        backgroundColor: sRed,
        snackPosition: SnackPosition.BOTTOM,
        colorText: sWhite,
      );
    }
  }

  RxList<Map<String, dynamic>> _allData = RxList<Map<String, dynamic>>([]);
  List<Map<String, dynamic>> get allData => _allData;

  Future<void> getAllData() async {
    try {
      final data = await _studentbookrequest.find().toList();
      _allData.value = data;
      update(); // Notify listeners of data change
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to fetch data: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: sRed,
        colorText: sWhite,
      );
    }
  }

  Future<void> deleteData(String uuid) async {
    try {
      await _studentbookrequest
          .deleteOne({"_id": uuid}); // Use string-based filter for the UUID
      Get.snackbar(
        "Success",
        "Data deleted successfully",
        backgroundColor: sGreen,
        snackPosition: SnackPosition.BOTTOM,
        colorText: sWhite,
      );
      // Optionally, update the UI to reflect the deletion
      await getAllData(); // Fetch updated data
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete data: $e",
        backgroundColor: sRed,
        snackPosition: SnackPosition.BOTTOM,
        colorText: sWhite,
      );
    }
  }

  @override
  void onClose() {
    _db.close();
    super.onClose();
  }
}
