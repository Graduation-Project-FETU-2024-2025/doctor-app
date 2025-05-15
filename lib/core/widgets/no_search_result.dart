import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.imgNoSearch,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).sorry,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                S.of(context).nosearchResult,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
