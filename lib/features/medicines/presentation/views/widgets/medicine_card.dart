import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 157 / 150,
      child: Stack(
        children: [
          Container(
            width: 157,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xffB3B3B3),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getIt<CacheHelper>().getCurrentLanguage() ==
                                            'ar'
                                        ? 'أباكافير'
                                        : 'Abacavir',
                                    style: AppStyles.semiBold14(context),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'Beclomethasone',
                                    style:
                                        AppStyles.semiBold10(context).copyWith(
                                      color: AppColors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '${41}\$',
                                style: AppStyles.semiBold12(context).copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 8,
            end: 10,
            child: CustomCheckbox(
              onChanged: (bool value) {},
              value: false,
            ),
          ),
          PositionedDirectional(
            top: 8,
            start: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  '1235',
                  style: AppStyles.semiBold10(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
