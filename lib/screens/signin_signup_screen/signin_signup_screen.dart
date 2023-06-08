import 'package:ashtar/components/screen.dart';
import 'package:flutter/material.dart';
import 'package:ashtar/components/app_button.dart';
import 'package:ashtar/components/generic_bind.dart';
import 'package:ashtar/components/text_field_custom.dart';
import 'package:ashtar/helper/validation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ashtar/screens/signin_signup_screen/signin_signup_data.dart';
import 'package:ashtar/utility/all_app_words.dart';
import 'package:ashtar/utility/app_colors.dart';

class SigninSignupScreen extends StatefulWidget {
  const SigninSignupScreen({Key? key}) : super(key: key);

  @override
  State<SigninSignupScreen> createState() => _SigninSignupScreenState();
}

class _SigninSignupScreenState extends State<SigninSignupScreen>
    with SigninSignupData {
  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      loadingCubit: loading,
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          child: Form(
            key: formKey,
            child: GenericBuilder<Auth>(
                genericCubit: loginOrRegisterControllerCubit,
                builder: (authType) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset('assets/images/logo.png', height: 250.h),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        width: .25.sw,
                        child: CustomTextField(
                          controller: emailController,
                          inputType: TextInputType.text,
                          labelText: 'Username',
                          hintText: 'E_Mail',
                          textFieldValidType: TextFieldvalidatorType.Email,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: .25.sw,
                        child: CustomTextField(
                            controller: passwordController,
                            inputType: TextInputType.text,
                            labelText: '',
                            hintText: 'Password',
                            textFieldValidType: TextFieldvalidatorType.Password,
                            onTap: () {}),
                      ),
                      Visibility(
                        visible: authType == Auth.register,
                        child: SizedBox(
                          height: 10.h,
                        ),
                      ),
                      Visibility(
                        visible: authType == Auth.register,
                        child: SizedBox(
                          width: .25.sw,
                          child: CustomTextField(
                              controller: confirmPasswordController,
                              inputType: TextInputType.text,
                              labelText: '',
                              hintText: 'Confirm password',
                              textFieldValidType:
                                  TextFieldvalidatorType.ConfirmPassword,
                              confirmPasswordController: passwordController,
                              onTap: () {}),
                        ),
                      ),
                      Visibility(
                        visible: authType == Auth.register,
                        child: SizedBox(
                          height: 10.h,
                        ),
                      ),
                      Visibility(
                        visible: authType == Auth.register,
                        child: SizedBox(
                          width: .25.sw,
                          child: CustomTextField(
                              controller: nameController,
                              inputType: TextInputType.text,
                              labelText: '',
                              hintText: 'Full Name',
                              textFieldValidType: TextFieldvalidatorType.Name,
                              onTap: () {}),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: .25.sw,
                        height: 35.h,
                        child: AppButton(
                          backgroundColor: Colors.teal,
                          onPress: authType == Auth.login ? login : register,
                          title: authType == Auth.login ? 'Login' : 'Register',
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            authType == Auth.login
                                ? 'Don’t have Account ?'
                                : 'Already have an account ?',
                            style: TextStyle(fontSize: 14.spMin),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          TextButton(
                              onPressed: () {
                                if (authType == Auth.login) {
                                  loginOrRegisterControllerCubit.update(
                                      data: Auth.register);
                                } else {
                                  loginOrRegisterControllerCubit.update(
                                      data: Auth.login);
                                }
                              },
                              child: Text(
                                authType == Auth.login ? 'Register' : 'Login',
                                style: TextStyle(color: Colors.teal),
                              ))
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
