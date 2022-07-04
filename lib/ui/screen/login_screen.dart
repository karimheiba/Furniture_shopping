import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/core/widgets/loading_widget.dart';
import 'package:furniture_shopping_app/ui/widget/custom_text_formfield.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';
import '../../business_logic/blocs/auth/auth_bloc.dart';
import '../../core/widgets/custom_snack_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
                child: logoScection(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: welcomeSection(),
              ),
              fieldSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldSection(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    String? email, password;
    return Form(
      key: key,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(left: 30, top: 38),
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 9,
            spreadRadius: .3,
          )
        ], color: Colors.white, shape: BoxShape.rectangle),
        child: Column(
          children: [
            CustomTextFormField(
              label: "Email",
              onSaved: (value) => email = value,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              label: "Password",
              obscureText: true,
              showSuffix: true,
              onSaved: (value) => password = value,
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Forgot password",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: primary,
                  fontFamily: "NunitoSans"),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  SnackBarMessage.showSuccessMessage(
                      message: 'Success Login User', context: context);
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      homeScreen,
                      arguments: context.read<AuthBloc>(),
                      (route) => false);
                } else if (state is AuthError) {
                  SnackBarMessage.showErrorMessage(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return LoadingWidget();
                }
                return SignButton(
                  buttonHight: 50,
                  buttonWidth: 285,
                  text: "Log in",
                  onPressed: () {
                    key.currentState!.save();
                    context.read<AuthBloc>().add(
                          LogInUserAuthEvent(
                              email: email!, password: password!),
                        );
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, signUpScreen);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primary,
                      fontFamily: "NunitoSans"),
                )),
            const SizedBox(
              height: 37,
            )
          ],
        ),
      ),
    );
  }

  Column welcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello !",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: textSecondary),
        ),
        Text("WELCOME BACK",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 2)),
      ],
    );
  }

  Row logoScection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 105,
          height: 2,
          color: strokeDivider,
        ),
        Container(
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primary, width: 1),
          ),
          child: Image(image: AssetImage("assets/images/logo.png")),
        ),
        Container(
          width: 105,
          height: 2,
          color: strokeDivider,
        ),
      ],
    );
  }
}
