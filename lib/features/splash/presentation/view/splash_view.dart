import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/core/database/cache/cashe_helper.dart';
import 'package:doctor_app/core/database/cache/secure_storage.dart';
import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () => _getInitRoute(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.gradient1,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.svgsSplashIcon,
          ),
        ),
      ),
    );
  }

  _getInitRoute() async {

    final token = await SecureStorage.instance.getData(key: ApiKeys.token);
    if (mounted) {
      if (token != null) {
        context.pushReplacementNamed(Routing.home);
      } else if (!getIt<CacheHelper>().getData(key: CacheKeys.isFirstTime)) {
        context.pushReplacementNamed(Routing.signIn);
      } else {
        context.pushReplacementNamed(Routing.onboarding);
      }
    }
  }
}
