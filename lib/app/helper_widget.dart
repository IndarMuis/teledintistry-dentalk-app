import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teledintistry/app/theme.dart';

successSnackBar({String? title, String? message}) {
  return Get.snackbar(
    "",
    "",
    duration: Duration(seconds: 2),
    backgroundColor: primaryColor,
    backgroundGradient: LinearGradient(
      colors: [
        primaryColor,
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    icon: Icon(
      Icons.check_circle,
      color: Colors.green[900],
      size: 55,
    ),
    padding: EdgeInsets.all(defaultMargin),
    borderColor: Colors.white,
    borderWidth: 1,
    titleText: Center(
        child: Text(
      "${title}",
      style: primaryTextStyle.copyWith(
        fontSize: 18,
        color: Colors.green[900],
        fontWeight: semiBold,
      ),
    )),
    messageText: Center(
        child: Text(
      "${message}",
      style: primaryTextStyle.copyWith(
        fontSize: 16,
        color: Colors.green[900],
        fontWeight: medium,
      ),
      textAlign: TextAlign.center,
    )),
  );
}

errorSnackBar({String? title, String? message}) {
  return Get.snackbar(
    "",
    "",
    duration: Duration(seconds: 2),
    backgroundColor: errorColor.withOpacity(0.8),
    backgroundGradient: LinearGradient(
      colors: [
        errorColor.withOpacity(0.8),
        Colors.white,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    icon: Icon(
      Icons.error,
      color: Colors.red[900],
      size: 55,
    ),
    padding: EdgeInsets.all(defaultMargin),
    borderColor: Colors.white,
    borderWidth: 1,
    titleText: Center(
        child: Text(
      "${title}",
      style: primaryTextStyle.copyWith(
        fontSize: 18,
        color: Colors.red[900],
        fontWeight: semiBold,
      ),
    )),
    messageText: Center(
        child: Text(
      "${message}",
      style: primaryTextStyle.copyWith(
        fontSize: 13,
        color: Colors.red[900],
        fontWeight: medium,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    )),
  );
}

Future dialogVerification(
    {required void Function()? onConfirm,
    bool isLoading = false,
    required String title,
    required IconData icon,
    required Color color}) {
  return Get.defaultDialog(
      title: "$title",
      titleStyle: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
      titlePadding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      contentPadding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      content: (isLoading)
          ? Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            )
          : Column(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: color,
                              ))),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Batal",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: color,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: color,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: onConfirm,
                      child: Text(
                        "Lanjut",
                        style: primaryTextStyle.copyWith(
                          fontSize: 15,
                          color: backgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ));
}
