import 'package:get/get.dart';
import 'package:zenshop/data/repositories/Categories/category_repository.dart';
import 'package:zenshop/features/shop/models/category_model.dart';
import 'package:zenshop/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// - load category data
  Future<void> fetchCategories() async{
    try{
      // show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source (Firebase, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      // remove loader
      isLoading.value=false;
    }
  }
  /// - load selected category data

  /// - get category or sub-category products
}