import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:furniture_shopping_app/core/constans/colors.dart';
import 'package:furniture_shopping_app/core/constans/strings.dart';
import 'package:furniture_shopping_app/core/widgets/custom_snack_bar.dart';
import 'package:furniture_shopping_app/ui/widget/custom_text_formfield.dart';
import 'package:furniture_shopping_app/ui/widget/sign_button.dart';

import '../../business_logic/blocs/auth/auth_bloc.dart';
import '../../core/widgets/loading_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(bottom: 25, left: 30),
                child: welcomeSection(),
              ),
              fieldSection(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldSection(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    String? name, email, password;
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
              label: "Name",
              onSaved: (value) => name = value,
            ),
            CustomTextFormField(
              label: "Email",
              onSaved: (value) => email = value,
            ),
            CustomTextFormField(
              label: "Password",
              obscureText: true,
              showSuffix: true,
              onSaved: (value) => password = value,
            ),
            CustomTextFormField(
              label: "Confirm Password",
              obscureText: true,
              showSuffix: true,
              onSaved: (value) {},
            ),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  SnackBarMessage.showSuccessMessage(
                      message: 'Success Create User', context: context);
                  Navigator.pushNamed(context, logInScreen);
                } else if (state is AuthError) {
                  SnackBarMessage.showErrorMessage(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const LoadingWidget();
                }
                return SignButton(
                  buttonHight: 50,
                  buttonWidth: 285,
                  text: "Sign Up",
                  onPressed: () {
                    key.currentState!.save();
                    (context).read<AuthBloc>().add(
                          CreateUserAuthEvent(
                            name: name!,
                            email: email!,
                            password: password!,
                          ),
                        );
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textSecondary,
                      fontFamily: "NunitoSans"),
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, logInScreen),
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primary,
                          fontFamily: "NunitoSans"),
                    )),
              ],
            ),
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
      children: const [
        Text("WELCOME ",
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
          child: const Image(image: AssetImage("assets/images/logo.png")),
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
