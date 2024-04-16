import 'package:ecom/controllers/auth_controller.dart';
import 'package:ecom/helper/common_methods.dart';
import 'package:ecom/helper/constents/color_const.dart';
import 'package:ecom/helper/global_components/custom_button.dart';
import 'package:ecom/helper/global_components/custom_lablel.dart';
import 'package:ecom/helper/global_components/custom_pass_filed.dart';
import 'package:ecom/helper/global_components/custom_textfiled.dart';
import 'package:ecom/view/sing_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/global_components/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (co) {
      return co.isLoadings == true
          ? const Scaffold(
              body: Center(child: LoadingWidget()),
            )
          : Scaffold(
              body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: CustomLabel(
                        text: 'Welcome To The  Home \n Basket !',
                        maxlines: 2,
                        size: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomLabel(
                      text:
                          'We are committed to make your shopping \n experience the best.',
                      maxlines: 2,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      controller: _emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextPasswordField(
                      controller: _passController,
                      labelText: 'Password',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomRaisedButton(
                      onpressed: () async {
                        if (_emailController.text.isEmpty) {
                          CommonMethods.errorMessage('Please Enter the Email');
                        } else if (CommonMethods.validateEmail(
                                _emailController.text) ==
                            false) {
                          CommonMethods.errorMessage(
                              'Please correct email Format');
                        } else if (_passController.text.isEmpty) {
                          CommonMethods.errorMessage(
                              'Please Enter the Password');
                        } else {
                          await co.loginUser(
                              _emailController.text.trim(), _passController.text.trim());
                        }
                      },
                      text: 'Login',
                      textcolor: Colors.white,
                      width: double.infinity,
                      height: 50,
                      color: ColorConst.lightdarkGreen,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(SignUpScreen());
                          },
                          child: const CustomLabel(
                              text: """Dont't have account ? SingUp""")),
                    )
                  ],
                ),
              ),
            ));
    });
  }
}
