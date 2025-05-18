import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key,
      required this.img,
      required this.isBtnValid,
      required this.height,
      this.isLocalImage = false});
  final String img;
  final bool isBtnValid;
  final double height;
  final bool isLocalImage;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: height,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.black
          : AppColors.white,
      elevation: 0.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: isLocalImage
            ? Image.asset(
                img,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: isBtnValid
          ? PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                height: 32.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.black
                      : AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 85.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white.withOpacity(.6)
                        : AppColors.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
