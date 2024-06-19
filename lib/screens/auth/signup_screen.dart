import 'package:country_code_picker/country_code_picker.dart';
import 'package:eventright_pro_user/constant/app_const_font.dart';
import 'package:eventright_pro_user/constant/app_constant.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/localization/localization_constant.dart';
import 'package:eventright_pro_user/provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late AuthProvider authProvider;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryCodePickerController = TextEditingController(text: "+91");

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  void initState() {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _countryCodePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor, size: 18)),
      ),
      body: ModalProgressHUD(
        inAsyncCall: authProvider.registerLoader,
        progressIndicator: const SpinKitCircle(
          color: AppColors.primaryColor,
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(getTranslated(context, AppConstant.letGetStarted).toString(), style: const TextStyle(fontSize: 30, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                Text(getTranslated(context, AppConstant.signUpDescription).toString(), style: const TextStyle(fontSize: 15, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsRegular)),
                const SizedBox(height: 50),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///email
                      Text(getTranslated(context, AppConstant.emailTitle).toString(), style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                      TextFormField(
                        style: const TextStyle(fontSize: 16, fontFamily: AppFontFamily.poppinsRegular),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: getTranslated(context, AppConstant.enterYourEmail), hintStyle: const TextStyle(color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium)),
                        validator: (String? value) {
                          Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern as String);

                          if (value!.isEmpty) {
                            return getTranslated(context, AppConstant.pleaseEnterEmail);
                          }
                          if (!regex.hasMatch(value)) {
                            return getTranslated(context, AppConstant.pleaseEnterValidEmail);
                          }
                          return null;
                        },
                      ),

                      ///first name
                      const SizedBox(height: 15),
                      Text(getTranslated(context, AppConstant.firstNameTitle).toString(), style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                      TextFormField(
                        style: const TextStyle(fontSize: 16, fontFamily: AppFontFamily.poppinsRegular),
                        controller: _firstNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: getTranslated(context, AppConstant.enterYourFirstName), hintStyle: const TextStyle(color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium)),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return getTranslated(context, AppConstant.pleaseEnterFirstName);
                          }
                          return null;
                        },
                      ),

                      ///last name
                      const SizedBox(height: 15),
                      Text(getTranslated(context, AppConstant.lastNameTitle).toString(), style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                      TextFormField(
                        style: const TextStyle(fontSize: 16, fontFamily: AppFontFamily.poppinsRegular),
                        controller: _lastNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: getTranslated(context, AppConstant.enterYourLastName), hintStyle: const TextStyle(color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium)),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return getTranslated(context, AppConstant.pleaseEnterLastName);
                          }
                          return null;
                        },
                      ),

                      ///password
                      const SizedBox(height: 15),
                      Text(getTranslated(context, AppConstant.password).toString(), style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.name,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
                        obscureText: _isHidden,
                        style: const TextStyle(fontSize: 16, fontFamily: AppFontFamily.poppinsRegular),
                        decoration: InputDecoration(
                          hintText: getTranslated(context, AppConstant.enterYourPassword).toString(),
                          hintStyle: const TextStyle(color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isHidden ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return getTranslated(context, AppConstant.pleaseEnterPassword).toString();
                          } else if (value.length < 6) {
                            return getTranslated(context, AppConstant.passwordMustBeAtLeastSixLetter).toString();
                          }
                          return null;
                        },
                      ),

                      ///phone
                      const SizedBox(height: 15),
                      Text(getTranslated(context, AppConstant.phoneTitle).toString(), style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                      TextFormField(
                        style: const TextStyle(fontSize: 16, fontFamily: AppFontFamily.poppinsRegular),
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: getTranslated(context, AppConstant.enterYourPhoneNumber).toString(),
                          hintStyle: const TextStyle(color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          prefixIcon: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    if (kDebugMode) {
                                      print(countryCode.dialCode);
                                    }
                                    setState(() {
                                      _countryCodePickerController.text = countryCode.dialCode!;
                                    });
                                  },
                                  initialSelection: _countryCodePickerController.text,
                                  favorite: const ['+91', 'IND'],
                                  showCountryOnly: false,
                                  showFlag: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                  padding: EdgeInsets.zero,
                                ),
                                const VerticalDivider(),
                              ],
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return getTranslated(context, AppConstant.pleaseEnterPhoneNumber).toString();
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Map<String, dynamic> body = {
                          "email": _emailController.text,
                          "first_name": _firstNameController.text,
                          "last_name": _lastNameController.text,
                          "password": _passwordController.text,
                          "phone": _phoneController.text,
                          "provider": "LOCAL",
                          "device_token": "",
                          'Countrycode':_countryCodePickerController.text
                        };
                        authProvider.callApiForRegister(body, context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: Size(MediaQuery.of(context).size.width, 45),
                    ),
                    child: Text(
                      getTranslated(context, AppConstant.signUp).toString(),
                      style: const TextStyle(color: AppColors.whiteColor, fontSize: 18, fontFamily: AppFontFamily.poppinsMedium),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
