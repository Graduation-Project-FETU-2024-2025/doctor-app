import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/secure_storage.dart';
import 'package:doctor_app/core/global_cubits/change_themes_cubit/change_themes_cubit.dart';
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/features/profile/presentation/view/widgets/change_language_dialog.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOptionContainer extends StatelessWidget {
  const ProfileOptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGray
            : AppColors.lightGray,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.gray, width: 1.5.w),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: ChangeLanguageDialog(),
                ),
              );
            },
            leading: SvgPicture.asset(AppIcons.svgsLanguage),
            title: Text(
              S.of(context).language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: SvgPicture.asset(AppIcons.svgsTheme),
            title: Text(
              S.of(context).darkMode,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Switch(
              activeColor: AppColors.black,
              activeTrackColor: AppColors.white,
              inactiveTrackColor: AppColors.black,
              inactiveThumbColor: AppColors.white,
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                context.read<ChangeThemesCubit>().changeAppTheme();
              },
            ),
          ),
          Divider(),
          ListTile(
            onTap: () async {
              await SecureStorage.instance.deleteData(key: CacheKeys.token);
              await SecureStorage.instance.deleteData(key: CacheKeys.id);
              if (context.mounted) {
                context.pushNamedAndRemoveUntil(
                  Routing.signIn,
                  predicate: (route) => false,
                );
              }
            },
            leading: SvgPicture.asset(AppIcons.svgsLogout),
            title: Text(
              S.of(context).logout,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.red,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
