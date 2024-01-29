import 'package:zenshop/data/repositories/user/user_model.dart';
import 'package:zenshop/utils/constants/enums.dart';
import 'package:zenshop/utils/constants/image_strings.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../routes/routes.dart';

class TDummyData {
  /// - Banners
  static final List<BannerModel> banners =[
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: false),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: false),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: false),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: false),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: false),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];

  /// -- user
  static final UserModel user = UserModel(
      firstName: 'Alan',
      lastName: 'Varghese',
      email: 'demotry12@gmail.com',
      phoneNumber: '+91 9207855783',
      profilePicture: TImages.user,
    address: [
      AddressModel(
        id: '1',
        name: 'Alan Varghese',
        phoneNumber : '+91 9207855783',
        street: 'Puliyakode, Melattur, Malappuram',
        city: 'Perinthalmanna',
        state: 'Kerala',
        postalCode: '679326',
        country: 'India',
      ),
      AddressModel(
        id: '6',
        name: 'John Thomas',
        phoneNumber : '+91 8767855783',
        street: 'Kalikavu, Nilambur, Malappuram',
        city: 'Nilambur',
        state: 'Kerala',
        postalCode: '679356',
        country: 'India',
      ),
    ]
  );

  /// - cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId : '001',
        variationId : '1',
        quantity: 1,
        title : products[0].title,
        image : products[0].thumbnail,
        brandName : products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
      productId : '002',
      variationId : '',
      quantity: 1,
      title : products[0].title,
      image : products[0].thumbnail,
      brandName : products[0].brand!.name,
      price: products[0].productVariations![0].price,
      selectedVariation: products[0].productVariations![0].attributeValues,
      ),
    ],
  );

  /// - order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate : DateTime(2023, 09, 1),
      deliveryDate :DateTime(2023, 09,5)),
    OrderModel(
        id: 'CWT0024',
        status: OrderStatus.shipped,
        items: cart.items,
        totalAmount: 369,
        orderDate : DateTime(2023, 09, 2),
        deliveryDate :DateTime(2023, 09,7)),
  ];

  /// - list of all categories
  static final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
  CategoryModel(id: '5', image: TImages. furnitureIcon, name: 'Furniture', isFeatured: true),
  CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
  CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
  CategoryModel(id: '4', image: TImages .animalIcon, name: 'Animals', isFeatured: true),
  CategoryModel(id: '6', image: TImages. shoeIcon, name: 'Shoes', isFeatured: true),
  CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
  CategoryModel(id: '14', image: TImages. jeweleryIcon, name: 'Jewelery', isFeatured: true),
  ///subcategories
  CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
  CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
  CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
  //furniture
  CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom Furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen Furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office Furniture', parentId: '5', isFeatured: false),
  //electronics
  CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
  CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

  ];

}