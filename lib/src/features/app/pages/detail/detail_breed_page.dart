


import 'package:cat_flutter_project/src/core/settings/app_fonts.dart';
import 'package:cat_flutter_project/src/features/app/widgets/app_bar_custom/app_bar_default.dart';
import 'package:cat_flutter_project/src/features/app/widgets/intelligense_row.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBreedPage extends StatelessWidget {
  static const routeName = '/detail';
  final CatEntity  ? catData;
  const DetailBreedPage({super.key, this.catData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: '${catData?.name}',
      ),
      body: SafeArea(
        child:ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:14.w),
              child: SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: Image.network('${catData?.imageCat?.url}', fit: BoxFit.fill,)),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.w),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 170,
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                          [
                            SizedBox(height: 12.h,),
                            Row(
                              children: [
                                Text('Origin: ', style: AppFonts.pTextW5S15,),
                                Text(catData?.origin ??'', style: AppFonts.pTextW5S15,),
                              ],),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                Text('Weigth: ', style: AppFonts.pTextW5S15,),
                                Text(catData?.weigthCat?.metric ??'', style: AppFonts.pTextW5S15,),
                              ],),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                Text('Intelligence: ', style: AppFonts.pTextW5S15,),
                                BarProgress(valor: catData?.intelligence??0)
                              ],),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                Text('Energy: ', style: AppFonts.pTextW5S15,),
                                BarProgress(valor: catData?.intelligence??0)
                              ],),
                            SizedBox(height: 12.h,),
                            Text('${catData?.description}', style: AppFonts.pTextW5S15)
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],)
      )
    );
  }
}


