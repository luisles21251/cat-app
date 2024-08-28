

import 'package:cat_flutter_project/src/features/app/bindings/home_binding.dart';
import 'package:cat_flutter_project/src/features/app/pages/home/home_page.dart';
import 'package:cat_flutter_project/src/features/app/pages/initial/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/detail/detail_breed_page.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (__,_){
        return GetMaterialApp(
          title: 'Cats Word',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
            ),
            useMaterial3: true,
          ),
          initialRoute:SplashScreen.routeName,
          getPages: [
            GetPage(
                name: HomePage.routeName,
                page:()=> HomePage(),
                binding: HomeBinding()),
            GetPage(name: SplashScreen.routeName, page:()=> const SplashScreen()),
            GetPage(name: DetailBreedPage.routeName, page:()=> const DetailBreedPage()),

          ],
        );
      },
    );
  }
}
