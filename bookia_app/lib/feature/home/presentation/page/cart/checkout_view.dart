import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/back_card_widget.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/feature/home/data/models/governrates_list.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  int governorateId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CheckoutLoadedState) {
          Navigator.pop(context);
          showSuccessDialog();
        } else if (state is HomeErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.redColor,
              content: Text('SOME ERROR OCCURRED'),
            ),
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: const BackCardWidget(),
            title: const Text('Checkout'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<HomeBloc>().add(PlaceOrderEvent(
                      name: usernameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      governorateId: governorateId.toString(),
                      address: addressController.text));
                }
              },
              text: 'Checkout',
              textStyle:
                  getTitleTextStyle(context, color: AppColors.whiteColor),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Total Price: ${widget.totalPrice} EGP',
                            style: getTitleTextStyle(context),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    const Divider(),
                    const Gap(20),
                    Row(
                      children: [
                        Text(
                          'Customer Information',
                          style: getBodyTextStyle(context, fontSize: 18),
                        ),
                      ],
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Address',
                      ),
                    ),
                    const Gap(15),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      child: DropdownButton(
                          dropdownColor: AppColors.secondaryColor,
                          isExpanded: true,
                          value: governorateId,
                          onChanged: (value) {
                            setState(() {
                              governorateId = value as int;
                            });
                          },
                          items: governorateList
                              .map((city) => DropdownMenuItem(
                                  value: city['id'],
                                  child: Text(
                                      city["governorate_name_en"].toString())))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  showSuccessDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => SimpleDialog(
              alignment: Alignment.center,
              backgroundColor: AppColors.whiteColor,
              contentPadding: const EdgeInsets.all(20),
              children: [
                const Gap(20),
                SvgPicture.asset(
                  AssetsIcons.doneSvg,
                  height: 150,
                  width: 150,
                ),
                const Gap(20),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Success',
                          style: getTitleTextStyle(context, fontSize: 24)),
                      const Gap(20),
                      Text(
                        'Your order will be delivered soon.\nThank you for choosing our app!',
                        textAlign: TextAlign.center,
                        style: getBodyTextStyle(context,
                            color: AppColors.primaryColor),
                      ),
                      const Gap(30),
                      CustomButton(
                        textStyle: getBodyTextStyle(context,
                            color: AppColors.whiteColor),
                        text: 'Back To Home ',
                        onTap: () {
                          pushAndRemoveUntil(context, const NavBarWidget());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}
