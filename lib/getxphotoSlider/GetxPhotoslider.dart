import 'package:get/state_manager.dart';

class PhotoSliderGetx extends GetxController {
  int maxline = 5;
  bool readmore = false;
  void reedmore() {
    readmore = !readmore;
    update();
  }
}
