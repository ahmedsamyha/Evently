import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utility/constants/colors.dart';
import 'package:evently/utility/constants/images.dart';
import 'package:evently/view/aouth/screens/register_view.dart';
import 'package:evently/view/aouth/screens/reset_password.dart';
import 'package:evently/view/aouth/widgets/custom_text_form_field.dart';
import 'package:evently/view/home/views/app_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool firstSwitchValue = false;
  bool secondSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    //final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                prefixIcon: Icons.email_rounded,
                label: "email".tr(),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                obscureText: true,
                prefixIcon: Iconsax.lock,
                suffixIcon: Iconsax.eye_copy,
                label: "password".tr(),
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                  },
                  child: Text(
                    "forget_password".tr(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.kPrimaryColor,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppMainView()));
                    },
                    child: Text("login".tr()),
                  )),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.kPrimaryColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.kPrimaryColor,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "do_not_have_account".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()));
                    },
                    child: Text(
                      "create_account".tr(),
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
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/google.svg'),
                    SizedBox(
                      width: 8,
                    ),
                    Text("login_with_google".tr())
                  ],
                ),
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
    );
  }
}
