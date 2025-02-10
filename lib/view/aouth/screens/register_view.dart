import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utility/constants/colors.dart';
import '../../../utility/constants/images.dart';
import '../../../utility/helper/helper_funcation.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();
  bool firstSwitchValue = false;
  bool secondSwitchValue = false;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Center(child: Image.asset(TAssets.verLogo)),
                SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  obscureText: false,
                  prefixIcon: Icons.person,
                  label: "name".tr(),
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Name Is Required';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  obscureText: false,
                  prefixIcon: Icons.email,
                  label: "email".tr(),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is Required';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gamil]+\.[com]+")
                        .hasMatch(value);
                    if (emailValid == false) {
                      return 'Email Not Valid';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  obscureText: true,
                  maxLines: 1,
                  prefixIcon: Iconsax.lock,
                  suffixIcon: Iconsax.eye_copy,
                  label: "password".tr(),
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return 'Password Is Required';
                    }
                    if (value.length < 6) {
                      return 'Password IS Too Week';
                    }
                    if (passwordController.text != value) {
                      return "Password Doesn't Match";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  prefixIcon: Iconsax.lock,
                  suffixIcon: Iconsax.eye_copy,
                  obscureText: true,
                  maxLines: 1,
                  label: "re_password".tr(),
                  controller: rePasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return 'Password Is Required';
                    }
                    if (value.length < 6) {
                      return 'Password IS Too Week';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseManager.createAccount(
                              nameController.text,
                              emailController.text,
                              passwordController.text, () {
                            return CircularProgressIndicator(
                              color: dark
                                  ? AppColors.textDarkWhite
                                  : AppColors.kPrimaryColor,
                            );
                          }, () {
                            Navigator.pop(context);
                          }, (message) {
                            AwesomeDialog(
                              btnCancelColor: const Color(0xfff44369),
                              btnOkColor: AppColors.kPrimaryColor,
                              dialogBackgroundColor: dark
                                  ? AppColors.darkBackground
                                  : AppColors.lightBackground,
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.topSlide,
                              title: 'Error',
                              desc: message,
                              btnOkOnPress: () {},
                            ).show();
                          });
                        }
                        //Navigator.push(context,MaterialPageRoute(builder:(context)=>OnBoardingView()));
                      },
                      child: Text("create_account".tr()),
                    )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already_have_account".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "login".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 24,
                ),
                AnimatedToggleSwitch.dual(
                  current: secondSwitchValue,
                  first: false,
                  second: true,
                  spacing: 10,
                  style: ToggleStyle(
                    borderColor: AppColors.kPrimaryColor,
                    backgroundColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    indicatorColor: AppColors.kPrimaryColor,
                  ),
                  borderWidth: 3,
                  height: 50,
                  onChanged: (value) {
                    setState(() {
                      secondSwitchValue = value;
                      if (value == true) {
                        context.setLocale(Locale('en'));
                        print(context.locale.toString());
                      } else {
                        context.setLocale(Locale('ar'));
                        print(context.locale.toString());
                      }
                    });
                  },
                  // onChanged:(value) => setState(() => secondSwitchValue = value),
                  iconBuilder: (value) => value
                      ? SvgPicture.asset(
                          'assets/images/lr.svg',
                          height: 40,
                          width: 40,
                        )
                      : SvgPicture.asset(
                          'assets/images/eg.svg',
                          height: 40,
                          width: 40,
                        ),
                  textBuilder: (value) => value
                      ? SvgPicture.asset(
                          'assets/images/eg.svg',
                          height: 40,
                          width: 40,
                        )
                      : SvgPicture.asset('assets/images/lr.svg',
                          height: 40, width: 40),
                  textMargin: EdgeInsets.zero,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
