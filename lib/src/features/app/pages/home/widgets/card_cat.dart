import 'package:cat_flutter_project/src/core/settings/app_fonts.dart';
import 'package:cat_flutter_project/src/features/app/controllers/home_controller.dart';
import 'package:cat_flutter_project/src/features/app/pages/detail/detail_breed_page.dart';
import 'package:cat_flutter_project/src/features/app/widgets/intelligense_row.dart';
import 'package:cat_flutter_project/src/features/app/widgets/shimmer/shimmer_device_loader.dart';
import 'package:cat_flutter_project/src/features/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardCat extends StatefulWidget {
  final CatEntity  ? catData;
  const CardCat({super.key, this.catData,});

  @override
  State<CardCat> createState() => _CardCatState();
}

class _CardCatState extends State<CardCat> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r)),
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.catData?.name}',
                style: AppFonts.pTextW6S14,
              ),
              InkWell(
                onTap: (){
                Get.to(DetailBreedPage(catData: widget.catData,));
                },
                child: Text(
                  'Mas...',
                  style: AppFonts.pTextW4S14,
                ),
              )
            ],
          ),
          SizedBox(height: 6.h,),
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: widget.catData?.imageCat?.url == null
                    ? const AssetImage('assets/images/placeholder.png') as ImageProvider
                    : NetworkImage(widget.catData!.imageCat!.url!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.catData?.origin}',
                style: AppFonts.pTextW5S14,),
              BarProgress(valor: widget.catData?.intelligence??0),
            ],
          ),
          SizedBox(height:6.h,),
        ],
      ),
    );
  }
}
