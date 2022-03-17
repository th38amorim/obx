import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/splash/splash_cubit.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/sign_in/sign_in_form_page.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snapshot) {
          pushAndReplaceToPage(context, SignInFormPage());
        },
        child: Scaffold(
          body: Container(
            color: backgroundDarkColor,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Hero(
                      tag: 'logo_hero',
                      child: Image.asset(
                        'assets/obenx_logo.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
