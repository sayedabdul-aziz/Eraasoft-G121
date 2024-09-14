import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/back_card_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/auth/data/models/request/register_params.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          pushAndRemoveUntil(context, const NavBarWidget());
        } else if (state is RegisterErrorState) {
          showErrorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Row(
              children: [BackCardWidget()],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Hello! Register to get started',
                    style: getHeadlineTextStyle(context),
                  ),
                  const Gap(32),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisible1,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                      suffixIcon: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible1 = !isPasswordVisible1;
                                });
                              },
                              child: SvgPicture.asset('assets/icons/eye.svg')),
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: isPasswordVisible2,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIconConstraints: const BoxConstraints(maxWidth: 33),
                      suffixIcon: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible2 = !isPasswordVisible2;
                                });
                              },
                              child: SvgPicture.asset('assets/icons/eye.svg')),
                        ],
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      return null;
                    },
                  ),
                  const Gap(30),
                  state is RegisterLoadingState
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'Register',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(RegisterEvent(
                                  RegisterParams(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          confirmPasswordController.text)));
                            }
                          }),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: getSmallTextStyle(context),
                      ),
                      TextButton(
                          onPressed: () {
                            pushReplacement(context, const LoginView());
                          },
                          child: Text(
                            'Login Now',
                            style: getSmallTextStyle(context,
                                color: AppColors.primaryColor),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
