import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/back_card_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/page/register_view.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/or_divider_widget.dart';
import 'package:bookia_app/feature/auth/presentation/widgets/social_btns_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordVisible = false;

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pop(context);

          pushAndRemoveUntil(context, const NavBarWidget());
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else if (state is LoginLoadingState) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            children: [BackCardWidget()],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: getSmallTextStyle(context),
              ),
              TextButton(
                  onPressed: () {
                    pushReplacement(context, const RegisterView());
                  },
                  child: Text(
                    'Sign Up',
                    style: getSmallTextStyle(context,
                        color: AppColors.primaryColor),
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you, Again!',
                  style: getHeadlineTextStyle(context),
                ),
                const Gap(32),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                    suffixIcon: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: SvgPicture.asset('assets/icons/eye.svg')),
                      ],
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: getSmallTextStyle(context),
                        )),
                  ],
                ),
                const Gap(30),
                CustomButton(
                    text: 'Login',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      }
                    }),
                const Gap(30),
                const OrDividerWidget(
                  text: 'Or Login with',
                ),
                const Gap(20),
                const SocialButtonsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
