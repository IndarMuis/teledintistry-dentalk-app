import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/modules/register/controllers/register_controller.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Icon(
                Icons.cancel,
                color: secondaryTextColor,
                size: 30,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              Container(
                child: Image.asset(
                  "assets/logo_register.png",
                  width: 250,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Register",
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
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Nama Lengkap",
                    suffixIcon: Icon(Icons.person_outlined),
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
                  controller: controller.umurController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Umur",
                    counterText: "",
                    suffixIcon: Icon(Icons.numbers),
                    suffixIconColor: secondaryTextColor,
                    focusColor: secondaryTextColor,
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
                  controller: controller.alamatController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Alamat",
                    focusColor: secondaryTextColor,
                    hintStyle: secondaryTextStyle,
                    suffixIcon: Icon(Icons.location_history),
                    suffixIconColor: secondaryTextColor,
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
                  controller: controller.teleponController,
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Telepon",
                    focusColor: secondaryTextColor,
                    hintStyle: secondaryTextStyle,
                    suffixIcon: Icon(Icons.phone),
                    counterText: "",
                    suffixIconColor: secondaryTextColor,
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
                  obscureText: true,
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
                      controller.register();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffF39A0E),
                        padding: EdgeInsets.all(10),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: (controller.isLoading.isTrue)
                        ? Center(
                            child: CircularProgressIndicator(
                            color: backgroundColor,
                            strokeWidth: 2.5,
                          ))
                        : Text(
                            "Sign Up",
                            style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                                color: backgroundColor,
                                fontSize: 18),
                          ),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun?",
                    style: secondaryTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Masuk",
                        style: secondaryTextStyle.copyWith(
                            fontSize: 15,
                            color: primaryColor,
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
