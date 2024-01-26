import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenshop/features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();
  
  /// variables
  final _db = FirebaseFirestore.instance;

  /// get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
  /// get sub categories
 
  /// upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try{
      // upload all the categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // loop through each category
      for(var category in categories) {
        // Get Image data link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its url
        final url = await storage.uploadImageData('Categories', file, category.name);

        // assign url to category image attribute
        category.image = url;

        // store category in firebase
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }
}