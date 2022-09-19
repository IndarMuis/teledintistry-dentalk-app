import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/logo_login.png",
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Login",
                style: primaryTextStyle.copyWith(
                    fontSize: 30, fontWeight: semiBold),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                shadowColor: primaryColor.withOpacity(0.5),
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Email",
                    suffixIcon: Icon(Icons.email_outlined),
                    focusColor: secondaryTextColor,
                    suffixIconColor: secondaryTextColor,
                    hintStyle: secondaryTextStyle,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none)),
                    filled: true,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                shadowColor: primaryColor.withOpacity(0.5),
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Password",
                    suffixIcon: Icon(Icons.lock_outline),
                    focusColor: secondaryTextColor,
                    suffixIconColor: secondaryTextColor,
                    hintStyle: secondaryTextStyle,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.white, style: BorderStyle.none)),
                    filled: true,
                    contentPadding: EdgeInsets.all(defaultMargin),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: EdgeInsets.all(15),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: (controller.isLoading.isTrue)
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: backgroundColor,
                            ),
                          )
                        : Text(
                            "Login",
                            style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                                color: backgroundColor,
                                fontSize: 20),
                          ),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: secondaryTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text(
                        "Daftar",
                        style: secondaryTextStyle.copyWith(
                            fontSize: 15,
                            color: Color(0xffF39A0E),
                            fontWeight: semiBold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
