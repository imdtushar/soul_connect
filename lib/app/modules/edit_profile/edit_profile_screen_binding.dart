import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:soul_connect/app/core/utils/utility.dart';

class EditProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileScreenController(), fenix: true);
  }
}

class EditProfileScreenController extends BaseController {
  TextEditingController aboutController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  List language = [
    "Hindi",
    "English",
    "Marathi",
    "Telugu",
    "Tamil",
    "Gujarati",
    "Bengali",
    "Malayalam",
    "Kannada",
    "Punjab",
    "Urdu",
    "Oriya",
  ];
  List lookingFor = [
    "Men",
    "Women",
    "Non-binary people",
    "Everyone",
  ];
  List education = [
    "High School",
    "Undergrad",
    "Postgraduate",
  ];
  List familyPLan = [
    "I want children",
    "I don’t want children",
    "I have children and want more",
    "I have children and don’t want more",
    "Not sure yet",
  ];
  List communication = [
    "WhatsApp",
    "Big time texter",
    "Phone Caller",
    "Video chatter",
    "Bad Texter",
    "Better in person",
  ];
  List pet = [
    "Dog",
    "Cat",
    "Reptile",
    "Amphibian",
    "Bird",
    "Fish",
    "Don’t have but love",
    "Others",
    "Want a pet",
    "All the pets",
  ];
  List drinking = [
    "Yes",
    "NO",
    "Sometimes",
  ];
  List workout = [
    "Everyday",
    "Often",
    "Sometimes",
    "Never",
  ];

  List dietaryPreference = [
    "Vegetarian",
    "Vegan",
    "Pescatarians",
    "Kosher",
    "Carnivore",
    "Omnivore",
    "Other",
  ];
  List socialMedia = [
    "Influence status",
    "Socially active",
    "Off the grid",
    "Passive scroller",
  ];  List sleepingHabits = [
    "Early bird",
    "Night owl",
    "In a septum",
  ];

  final _pickedFileList = RxList<File>();

  List<File> get pickedFileList => _pickedFileList;

  Future<void> selectMultipleImages(int maxLimit) async {
    const maxImageBytes = 1048576;

    List ? selectedImages =
    // List<AssetEntity> ? selectedImages =
        await AppUtility.multipleImagePicker(maxLimit);

    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (var assetEntity in selectedImages) {
        File? selectedPath = await assetEntity.file;
        File? resultFile = await processImage(selectedPath, maxImageBytes);

        if (resultFile != null) {
          _pickedFileList.add(resultFile);
          update();
        }
      }
    }
  }

  Future<File?> processImage(File? selectedPath, int maxImageBytes) async {
    if (selectedPath == null) return null;

    var size = selectedPath.lengthSync();

    if (size > (1 * maxImageBytes)) {
      AppUtility.showSnackBar(
        'Image size must be less than 1mb',
        '',
      );
      return null;
    } else if (size < (maxImageBytes / 2)) {
      return selectedPath;
    } else {
      var tempDir = await getTemporaryDirectory();
      var timestamp = DateTime.now().millisecondsSinceEpoch;

      var xFile = await FlutterImageCompress.compressAndGetFile(
        selectedPath.path,
        '${tempDir.absolute.path}/temp$timestamp.jpg',
        quality: 60,
        format: CompressFormat.jpeg,
      );

      if (xFile != null) {
        return File(xFile.path);
      }

      AppUtility.closeDialog();
      return null;
    }
  }

  imagePickerGallery(int indexValue) {
    int numberOfImages = 8 - indexValue;

    if (numberOfImages > 0) {
      selectMultipleImages(numberOfImages);
    } else {
      AppUtility.showErrorSnackBar('Max 8 Image Upload');
    }
  }
}
