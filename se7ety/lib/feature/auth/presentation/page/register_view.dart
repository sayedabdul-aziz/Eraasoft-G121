import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.index});
  final int index;

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisable = true;

  String handleUserType(int index) {
    return index == 0 ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'سجل حساب جديد كـ "${handleUserType(widget.index)}"',
                    style: getTitleStyle(),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _displayName,
                    style: const TextStyle(color: AppColors.textColor),
                    decoration: InputDecoration(
                      hintText: 'الاسم',
                      hintStyle: getbodyStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل الاسم';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(
                      hintText: 'Sayed@example.com',
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                        // } else if (!emailValidate(value)) {
                        //   return 'من فضلك ادخل الايميل صحيحا';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: AppColors.textColor),
                    obscureText: isVisable,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: '********',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon((isVisable)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded)),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                      return null;
                    },
                  ),
                  const Gap(30),
                  CustomButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // if (widget.index == 0) {
                        //   context.read<AuthCubit>().registerDoctor(
                        //       _displayName.text,
                        //       _emailController.text,
                        //       _passwordController.text);
                        // } else {
                        //   context.read<AuthCubit>().registerPatient(
                        //       _displayName.text,
                        //       _emailController.text,
                        //       _passwordController.text);
                        // }
                      }
                    },
                    text: "تسجيل حساب",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لدي حساب ؟',
                          style: getbodyStyle(color: AppColors.textColor),
                        ),
                        TextButton(
                            onPressed: () {
                              // Navigator.of(context)
                              //     .pushReplacement(MaterialPageRoute(
                              //   builder: (context) =>
                              //       LoginView(index: widget.index),
                              // ));
                            },
                            child: Text(
                              'سجل دخول',
                              style:
                                  getbodyStyle(color: AppColors.primaryColor),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
