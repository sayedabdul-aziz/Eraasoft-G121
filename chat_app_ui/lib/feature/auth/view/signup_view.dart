import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/feature/auth/view/login_view.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                  'Create an account !',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    // fillColor: Colors.grey,
                    // filled: true,
                    label: Text(
                      'Name',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    // hintText: 'Enter your email..',
                    prefixIcon: Icon(
                      Icons.person,
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
                  keyboardType: TextInputType.emailAddress,
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
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
                                  builder: (context) => const LoginView()));
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
    );
  }
}
