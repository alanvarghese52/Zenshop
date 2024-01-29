import 'package:get/get.dart';
import 'package:zenshop/features/shop/models/banner_model.dart';
import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{

  /// variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// update page navigational data
  void updatePageIndicator(index) {
    carousalCurrentIndex.value =index;
  }

  /// fetch banners
  Future<void> fetchBanners() async{
    try{
      // show loader while loading categories
      isLoading.value = true;

      //Fetch Banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // assign banner
      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      // remove loader
      isLoading.value=false;
    }
  }
}