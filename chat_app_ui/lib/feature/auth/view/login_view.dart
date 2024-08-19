import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/auth/view/signup_view.dart';
import 'package:chat_app_ui/feature/chat/view/chat_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

// wrap column With Form (Use key <FormState>)
// Use Validator in TextFormField
// Validate with form key when button is pressed

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGWfBW0D_yD9ojL1B9o86MZkY1dOyk6l4_uA&s',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome Back !',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        'Email',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      // hintText: 'Enter your email..',
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscure,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 9) {
                        return 'Password must be at least 9 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text(
                        'Password',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      // hintText: 'Enter your email..',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_rounded
                                : Icons.remove_red_eye_rounded,
                            color: AppColors.primaryColor,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          )),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          )),
                      errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const ChatView()));
                            }
                          },
                          child: const Text('Login'))),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SignupView()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: AppColors.primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
