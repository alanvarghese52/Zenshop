import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zenshop/features/authentication/screens/login/login.dart';
import 'package:zenshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:zenshop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:zenshop/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:zenshop/features/shop/screens/product_reviews/product_reviews.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';
import 'routes.dart';

class AppRoutes{
  static final pages =[
  GetPage(name: TRoutes.home, page: () => const HomeScreen()),
  GetPage(name: TRoutes.store, page: () => const StoreScreen()),
  GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
  GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
  GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
  GetPage(name: TRoutes.order, page: () => const OrderScreen()),
  GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
  GetPage(name: TRoutes.cart, page: () => const CartScreen()),
  GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
  GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
  GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
  GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
  GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
  GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // add more Get page entries as needed
  ];
}