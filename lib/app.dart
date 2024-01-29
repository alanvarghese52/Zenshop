import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zenshop/bindings/general_bindings.dart';
import 'package:zenshop/routes/app_routes.dart';
import 'package:zenshop/utils/constants/colors.dart';
import 'package:zenshop/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,

      /// show loader or circular progress indicator meanwhile authentication
      /// repository is deciding to show relevent screen.

      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
