import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forget_password2".tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/images/reset.svg'),
              SizedBox(
                height: 24,
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
                      onPressed: () {}, child: Text("reset_password".tr())))
            ],
          ),
        ),
      ),
    );
  }
}
