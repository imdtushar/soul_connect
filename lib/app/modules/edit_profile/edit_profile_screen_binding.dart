import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:soul_connect/app/core/base/base_controller.dart';
import 'package:soul_connect/app/core/utils/utility.dart';

class EditProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileScreenController(), fenix: true);
  }
}

class EditProfileScreenController extends BaseController {
  final _pickedFileList = RxList<File>();

  List<File> get pickedFileList => _pickedFileList;

  Future<void> selectMultipleImages(int maxLimit) async {
    const maxImageBytes = 1048576;

    List<AssetEntity>? selectedImages = await AppUtility.multipleImagePicker(maxLimit);

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