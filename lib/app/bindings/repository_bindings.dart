import 'package:get/get.dart';

import '../data/repository/repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Repository>(
      () => Repository(),
      tag: (Repository).toString(),
      fenix: true
    );
  }
}
