import 'package:eventright_pro_user/constant/app_const_font.dart';
import 'package:eventright_pro_user/constant/app_constant.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/localization/localization_constant.dart';
import 'package:eventright_pro_user/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late AuthProvider authProvider;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isHidden = true;
  bool _isHidden1 = true;
  bool _isHidden2 = true;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }
  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);

    return ModalProgressHUD(
      inAsyncCall: authProvider.changePasswordLoader,
      progressIndicator: const SpinKitCircle(
        color: AppColors.primaryColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, size: 18, color: AppColors.whiteColor)),
          title: Text(getTranslated(context, AppConstant.changePassword).toString(),
              style:
                  const TextStyle(fontSize: 16, color: AppColors.whiteColor, fontFamily: AppFontFamily.poppinsMedium)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildForm(context),
                  const SizedBox(height: 15),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> body = {
                        "old_password": _oldPasswordController.text,
                        "password": _newPasswordController.text,
                        "password_confirmation": _confirmPasswordController.text
                      };
                      print(body);
                      authProvider.callApiForChangePassword(body).then((value) {
                        if (value.data!.success == true) {
                          Navigator.of(context).pop();
                        }
                      });
                    }
                  });
                },
                child: Text(getTranslated(context, AppConstant.changePassword).toString(),
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.whiteColor, fontFamily: AppFontFamily.poppinsMedium)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, minimumSize: Size(MediaQuery.of(context).size.width, 45)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _isHidden,
            validator: (value) {
              if (value!.isEmpty) {
                return getTranslated(context, AppConstant.pleaseEnterOldPassword).toString();
              } else if (value.length < 6) {
                return getTranslated(context, AppConstant.passwordMustBeAtLeastSixLetter).toString();
              }
              return null;
            },
            style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium),
            controller: _oldPasswordController,
            decoration: InputDecoration(
              hintText: getTranslated(context, AppConstant.enterYourOldPassword).toString(),
              hintStyle: const TextStyle(
                  fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsMedium),
              suffixIcon: IconButton(
                icon: Icon(
                  _isHidden ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _isHidden1,
            validator: (value) {
              if (value!.isEmpty) {
                return getTranslated(context, AppConstant.pleaseEnterNewPassword).toString();
              } else if (value.length < 6) {
                return getTranslated(context, AppConstant.passwordMustBeAtLeastSixLetter).toString();
              }
              return null;
            },
            style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium),
            controller: _newPasswordController,
            decoration: InputDecoration(
              hintText: getTranslated(context, AppConstant.enterYourNewPassword).toString(),
              hintStyle: const TextStyle(
                  fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsMedium),
              suffixIcon: IconButton(
                icon: Icon(
                  _isHidden1 ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden1 = !_isHidden1;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: _isHidden2,
            validator: (value) {
              if (value!.isEmpty) {
                return getTranslated(context, AppConstant.pleaseEnterConfirmPassword).toString();
              } else if (value.length < 6) {
                return getTranslated(context, AppConstant.passwordMustBeAtLeastSixLetter).toString();
              } else if (_newPasswordController.text != _confirmPasswordController.text) {
                return getTranslated(context, AppConstant.newPasswordAndConfirmPasswordDoesNotMatch).toString();
              }
              return null;
            },
            style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium),
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              hintText: getTranslated(context, AppConstant.enterYourConfirmPassword).toString(),
              hintStyle: const TextStyle(
                  fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsMedium),
              suffixIcon: IconButton(
                icon: Icon(
                  _isHidden2 ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden2 = !_isHidden2;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
