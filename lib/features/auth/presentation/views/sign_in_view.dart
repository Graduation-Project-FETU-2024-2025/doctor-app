import 'package:doctor_app/features/auth/presentation/views/widgets/custom_auth_sliver_app_bar.dart';
import 'package:doctor_app/features/auth/presentation/views/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';
class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAuthSliverAppBar(),
            SliverToBoxAdapter(
              child: SignInBody(),
            ),
          ],
        ),
      ),
    );
  }
}
