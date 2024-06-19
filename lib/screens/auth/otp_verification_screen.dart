import 'package:eventright_pro_user/constant/app_const_font.dart';
import 'package:eventright_pro_user/constant/app_constant.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/localization/localization_constant.dart';
import 'package:eventright_pro_user/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  final String id;
  final String otp;
  const OtpVerificationScreen({super.key, required this.email, required this.id, required this.otp});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(
      context,
    );
    print(widget.id);
    return ModalProgressHUD(
      inAsyncCall: authProvider.loginLoader,
      progressIndicator: const SpinKitCircle(
        color: AppColors.primaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
              size: 18,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                getTranslated(context, AppConstant.verification).toString(),
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColors.blackColor,
                  fontFamily: AppFontFamily.poppinsMedium,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: getTranslated(context, AppConstant.weWillSendYouAOneTimePasswordOnThis).toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.blackColor,
                    fontFamily: AppFontFamily.poppinsRegular,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: " ${getTranslated(context, AppConstant.emailTitle).toString()}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.blackColor,
                        fontFamily: AppFontFamily.poppinsSemiBold,
                      ),
                    ),
                    const TextSpan(
                      text: " is ",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.blackColor,
                        fontFamily: AppFontFamily.poppinsRegular,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: " ${widget.email}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.blackColor,
                        fontFamily: AppFontFamily.poppinsSemiBold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              widget.otp.isNotEmpty ? Text("Your OTP is :${widget.otp}") : const SizedBox(),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: false,
                autoFocus: true,
                borderRadius: BorderRadius.circular(4),
                cursorColor: AppColors.primaryColor,
                disabledBorderColor: AppColors.inputTextColor,
                focusedBorderColor: AppColors.primaryColor,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  otpController.text = verificationCode;
                }, // end onSubmit
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Map<String, String> body = {
                          "id": widget.id,
                          "otp": otpController.text,
                        };
                        authProvider.callApiVerify(body, context);
                      },
                      child: Text(getTranslated(context, AppConstant.verify).toString()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: getTranslated(context, AppConstant.doNotReceiveTheOTP).toString(),
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 12,
                    fontFamily: AppFontFamily.poppinsRegular,
                  ),
                  children: [
                    TextSpan(
                      text: " ${getTranslated(context, AppConstant.resendOtp).toString()}",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFontFamily.poppinsMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
