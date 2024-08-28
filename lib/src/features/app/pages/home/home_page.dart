import 'package:cat_flutter_project/src/core/settings/app_colors.dart';
import 'package:cat_flutter_project/src/core/settings/app_fonts.dart';
import 'package:cat_flutter_project/src/features/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/inputs/text_form_field_outline.dart';
import 'widgets/card_cat.dart';


@immutable
class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 12.h,
                ),
                child: SizedBox(
                    child: Text(
                  'Cats Word',
                  style: AppFonts.pTextW6S16.copyWith(color: AppColors.textColor),
                  textAlign: TextAlign.center,
                )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: TextFormFieldOutline(
                  hintText: 'Search breed',
                    suffixIcon: Icon(Icons.search),
                    controller:ctrl.searchCtrl,
                  onChanged: ctrl.changeSearch,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 170,
                child: GetBuilder<HomeController>(
                    init: ctrl,
                    builder: (_) {
                  return Obx((){
                    if(_.isLoadBreeds.value || _.isSearch.value) {
                      return SizedBox(
                        height: 50.h,
                        width: 50.w,
                      );
                       // child: const CircularProgressIndicator());
                    }else if(_.catListSearch.isNotEmpty){
                     return  CustomScrollView(
                       slivers: [
                         SliverList(
                           delegate: SliverChildListDelegate(
                             _.catListSearch.map((cat) => CardCat(catData: cat,)).toList() ?? [],
                           ),
                         ),
                       ],
                     );

                    } else{
                      return CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              _.catList.map((cat) => CardCat(catData: cat,)).toList() ?? [],
                            ),
                          ),
                        ],
                      );
                    }

                  });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
