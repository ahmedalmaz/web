import 'package:ashtar/components/custom_items_cubit/loading_cubit/loading_cubit.dart';
import 'package:ashtar/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:ashtar/cubits/generic_cubit/generic_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SigninSignupData {
  Loading loading = Loading();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GenericCubit<Auth> loginOrRegisterControllerCubit = GenericCubit<Auth>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  initData() {
    loginOrRegisterControllerCubit.update(data: Auth.login);
  }

  login() async {
    if (formKey.currentState!.validate()) {
      loading.show;
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        await auth
            .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value)async {
          Fluttertoast.showToast(msg: 'welcome ${value.user!.displayName}');
          SharedPreferences ref = await SharedPreferences.getInstance();
           ref.setString('appToken','aaaaaaaaaa');
          goToWithRemoveRoute(screenName: ScreenNames.dashboardScreen);
        });
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: error.message!.split(':')[3].toString());
      } catch (error) {
        print(error);
      }
      loading.hide;
    }
  }

  register() async {
    if (formKey.currentState!.validate()) {
      loading.show;
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        await auth
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value)async {
          SharedPreferences ref = await SharedPreferences.getInstance();
          ref.setString('appToken','aaaaaaaaaa');
          value.user!.updateDisplayName(nameController.text);
          goToWithRemoveRoute(screenName: ScreenNames.dashboardScreen);
        });
      } on FirebaseAuthException catch (error) {
        Fluttertoast.showToast(msg: error.message!.split(':')[3].toString());
      } catch (error) {
        print(error);
      }
      loading.hide;
    }
  }
}

enum Auth { login, register }
