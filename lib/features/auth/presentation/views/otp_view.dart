import 'package:doctor_app/features/auth/presentation/views/widgets/custom_auth_sliver_app_bar.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/otp_body.dart';
import 'package:flutter/material.dart';
class OTPView extends StatelessWidget {
  const OTPView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAuthSliverAppBar(
              canGoBack: true,
            ),
            SliverToBoxAdapter(
              child: OTPBody(email: email),
            ),
          ],
        ),
      ),
    );
  }
}
