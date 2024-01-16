import 'package:get/get.dart';
import 'package:zenshop/common/widgets/loaders/network_manager.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}