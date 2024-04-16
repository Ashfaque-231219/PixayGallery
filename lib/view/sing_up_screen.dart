import 'package:ecom/helper/common_methods.dart';
import 'package:ecom/helper/global_components/custom_lablel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/auth_controller.dart';
import '../helper/constents/color_const.dart';
import '../helper/global_components/custom_button.dart';
import '../helper/global_components/custom_pass_filed.dart';
import '../helper/global_components/custom_textfiled.dart';
import '../helper/global_components/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _mobileController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    TextEditingController _confirmController = TextEditingController();
    return GetBuilder<AuthController>(builder: (co) {
      return co.isLoadings == true
          ? const Scaffold(
        body: Center(child: LoadingWidget()),
      )
          :     Scaffold( body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: CustomLabel(
                  text: 'Registration !',
                  maxlines: 2,
                  size: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              AppTextField(
                controller: _nameController,
                labelText: 'Name',

              ),
              SizedBox(
                height: 10,
              ),
               AppTextField(
                controller: _emailController,
                labelText: 'Email',

              ),
              const SizedBox(
                height: 10,
              ),
               AppTextField(
                controller: _mobileController,
                labelText: 'Mobile No.',

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
               AppTextPasswordField(
                 controller: _confirmController,
                labelText: 'Confirm Password',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomRaisedButton(
                text: 'SingUP',
                onpressed: ()async{
                  if(_nameController.text.isEmpty){
                    CommonMethods.errorMessage('Please Enter the Name');
                  }
                  else if(_emailController.text.isEmpty){
                    CommonMethods.errorMessage('Please Enter the Email');


                  }
                  else if(CommonMethods.validateEmail(_emailController.text)== false){
                    CommonMethods.errorMessage('Invalid Email');


                  }
                  else if(_passController.text.isEmpty){
                  CommonMethods.errorMessage('Please Enter the Password');


                  }
                  else if(_confirmController.text.isEmpty){
                    CommonMethods.errorMessage('Please Enter the Password');


                  }
                  else if(_confirmController.text != _confirmController.text){
                    CommonMethods.errorMessage('Confirm Password and Password is not ');


                  }
                  else{
                    co.registerUser(_nameController.text, _emailController.text, _mobileController.text, _passController.text);
                  }



                },
                textcolor: Colors.white,
                width: double.infinity,
                height: 50,
                color: ColorConst.lightdarkGreen,
              ),
            ],
          ),
        ),
      ));

    });

  }
}
