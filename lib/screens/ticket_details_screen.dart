import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:eventright_pro_user/constant/app_const_font.dart';
import 'package:eventright_pro_user/constant/app_constant.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/constant/pref_constants.dart';
import 'package:eventright_pro_user/constant/preferences.dart';
import 'package:eventright_pro_user/localization/localization_constant.dart';
import 'package:eventright_pro_user/provider/ticket_provider.dart';
import 'package:eventright_pro_user/screens/ticket_sub_details_screen.dart';
import 'package:eventright_pro_user/utilities/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({Key? key}) : super(key: key);

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  late TicketProvider ticketProvider;

  @override
  void initState() {
    ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ticketProvider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
              size: 18,
            )),
        title: Text(getTranslated(context, AppConstant.ticketDetails).toString(),
            style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
      ),
      body: ModalProgressHUD(
        inAsyncCall: ticketProvider.eventTicketLoader,
        progressIndicator: const SpinKitCircle(color: AppColors.primaryColor),
        child: ticketProvider.ticketData.isNotEmpty
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(ticketProvider.eventName,
                        style:
                            const TextStyle(
                            fontSize: 20, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
                    Text(getTranslated(context, AppConstant.by).toString() + " " + ticketProvider.organizerName,
                        style:
                            const TextStyle(
                            fontSize: 14, color: AppColors.blueColor, fontFamily: AppFontFamily.poppinsMedium)),
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          shrinkWrap: true,
                          itemCount: ticketProvider.ticketData.length,
                          padding: const EdgeInsets.only(bottom: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ticketProvider.callApiForTicketDetails(ticketProvider.ticketData[index].id).then((value) {
                                  if (value.data!.success == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                                  TicketSubDetails(
                                          ticketType: ticketProvider.ticketData[index].name!,
                                          isSeatMapModuleInstalled:
                                              ticketProvider.module != null && ticketProvider.module!.isInstall != null
                                                  ? ticketProvider.module!.isInstall!.toInt()
                                                  : 0,
                                          seatMapId: ticketProvider.ticketData[index].seatMapId != null
                                              ? ticketProvider.ticketData[index].seatMapId!.toInt()
                                              : 0,
                                        ),
                                      ),
                                    );
                                  }
                                });
                              },
                              child: CouponCard(
                                // height: 180,
                                // curveRadius: 15,
                                // borderRadius: 10,
                                height: 200,
                                curvePosition: 135,
                                curveRadius: 15,
                                borderRadius: 10,
                                backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                                firstChild: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            getTranslated(context, AppConstant.ticketType).toString() + " : ",
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                          Text(
                                            ticketProvider.ticketData[index].type!.capitalize(),
                                            style: const TextStyle(
                                                color: AppColors.inputTextColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            getTranslated(context, AppConstant.price).toString() + " : ",
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                          Text(
                                            SharedPreferenceHelper.getString(Preferences.currencySymbol) +
                                                ticketProvider.ticketData[index].price!.toString(),
                                            style: const TextStyle(
                                                color: AppColors.inputTextColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            getTranslated(context, AppConstant.quantity).toString() + " : ",
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                          Text(
                                            ticketProvider.ticketData[index].quantity!.toString(),
                                            style: const TextStyle(
                                                color: AppColors.inputTextColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getTranslated(context, AppConstant.time).toString() + " : ",
                                            style: const TextStyle(
                                                color: AppColors.blackColor,
                                                fontSize: 16,
                                                fontFamily: AppFontFamily.poppinsMedium),
                                          ),
                                          Expanded(
                                            child: Text(
                                              DateFormat('MMM dd, yyyy hh:mm aa').format(
                                                      DateTime.parse(ticketProvider.ticketData[index].startTime!)) +
                                                  "-" +
                                                  DateFormat('MMM dd, yyyy hh:mm aa')
                                                      .format(DateTime.parse(ticketProvider.ticketData[index].endTime!)),
                                              style: const TextStyle(
                                                  color: AppColors.inputTextColor,
                                                  fontSize: 16,
                                                  fontFamily: AppFontFamily.poppinsMedium),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                secondChild: Container(
                                  width: double.maxFinite,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ticketProvider.ticketData[index].description ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.inputTextColor,
                                          fontFamily: AppFontFamily.poppinsRegular),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            : Center(child: Text(getTranslated(context, AppConstant.noDataFound).toString())),
      ),
    );
  }
}
