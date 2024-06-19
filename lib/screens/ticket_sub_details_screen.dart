import 'package:coupon_uikit/coupon_uikit.dart';
// TODO: Seat Mapping Module: Uncomment Following if you want to add this module
// import 'package:eventright_pro_user/SeatMap/seating_screen.dart';
import 'package:eventright_pro_user/constant/app_const_font.dart';
import 'package:eventright_pro_user/constant/app_constant.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/constant/common_function.dart';
import 'package:eventright_pro_user/constant/pref_constants.dart';
import 'package:eventright_pro_user/constant/preferences.dart';
import 'package:eventright_pro_user/localization/localization_constant.dart';
import 'package:eventright_pro_user/provider/ticket_provider.dart';
import 'package:eventright_pro_user/screens/coupon_screen.dart';
import 'package:eventright_pro_user/screens/payment_gateway_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class TicketSubDetails extends StatefulWidget {
  final String? ticketType;
  final int isSeatMapModuleInstalled;
  final int? seatMapId;
  const TicketSubDetails({Key? key, this.ticketType, required this.isSeatMapModuleInstalled, this.seatMapId})
      : super(key: key);

  @override
  State<TicketSubDetails> createState() => _TicketSubDetailsState();
}

class _TicketSubDetailsState extends State<TicketSubDetails> {
  int quantity = 1;
  late TicketProvider ticketProvider;
  int totalAmount = 0;
  double discountAmount = 0;
  String couponCode = '';
  // ignore: prefer_typing_uninitialized_variables
  var result;

  @override
  void initState() {
    ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    setAmount();

    super.initState();
  }
  void setAmount() async {
    setState(() {
      totalAmount = ticketProvider.totalTax + quantity * ticketProvider.price;
    });
  }

  void increment() {
    if (ticketProvider.soldOut != true) {
      if (quantity < ticketProvider.tickerPerOrder) {
        quantity++;
        totalAmount = totalAmount + ticketProvider.price;
      } else {
        CommonFunction.toastMessage("You can not buy more than ${ticketProvider.tickerPerOrder}");
      }
    } else {
      CommonFunction.toastMessage("Ticket Not Available");
    }
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      totalAmount = totalAmount - ticketProvider.price - discountAmount.toInt();
    }
  }

  @override
  Widget build(BuildContext context) {
    ticketProvider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, size: 18, color: AppColors.blackColor)),
        title: Text(getTranslated(context, AppConstant.ticketDetails).toString(),
            style: const TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ModalProgressHUD(
          inAsyncCall: ticketProvider.ticketDetailsLoader,
          progressIndicator: const SpinKitCircle(color: AppColors.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(ticketProvider.eventName,
                  style: const TextStyle(
                      fontSize: 20, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
              Text(widget.ticketType!,
                  style: const TextStyle(
                      fontSize: 20, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium)),
              Text(getTranslated(context, AppConstant.by).toString() + " " + ticketProvider.organizerName,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.blueColor, fontFamily: AppFontFamily.poppinsMedium)),
              const SizedBox(height: 15),
              Text(ticketProvider.startDate + " - ",
                  style:
                      const TextStyle(
                      fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsRegular)),
              Text(ticketProvider.endDate,
                  style:
                      const TextStyle(
                      fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsRegular)),
              const SizedBox(height: 10),
              const Divider(height: 1),
              CouponCard(
                height: 190,
                curveRadius: 15,
                curvePosition: 110,
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
                                color: AppColors.blackColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                          Text(
                            widget.ticketType!,
                            style: const TextStyle(
                                color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            getTranslated(context, AppConstant.price).toString() + " : ",
                            style: const TextStyle(
                                color: AppColors.blackColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                          Text(
                            ticketProvider.price.toString(),
                            style: const TextStyle(
                                color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            getTranslated(context, AppConstant.quantity).toString() + " : ",
                            style: const TextStyle(
                                color: AppColors.blackColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                          ticketProvider.soldOut != true
                              ? Text(
                                  ticketProvider.qty.toString(),
                                  style: const TextStyle(
                                      color: AppColors.inputTextColor,
                                      fontSize: 16,
                                      fontFamily: AppFontFamily.poppinsMedium),
                                )
                              : Text(
                                  getTranslated(context, AppConstant.soldOut).toString(),
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
                            getTranslated(context, AppConstant.time).toString() + " : ",
                            style: const TextStyle(
                                color: AppColors.blackColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                          Text(
                            ticketProvider.time,
                            style: const TextStyle(
                                color: AppColors.inputTextColor, fontSize: 16, fontFamily: AppFontFamily.poppinsMedium),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text(
                                getTranslated(context, AppConstant.howMuchDoYouWant).toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                    fontFamily: AppFontFamily.poppinsRegular),
                              )),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      decrement();
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration:
                                        const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
                                    child: const Icon(Icons.remove, color: AppColors.whiteColor),
                                  ),
                                ),
                                Text('$quantity',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.inputTextColor,
                                        fontFamily: AppFontFamily.poppinsMedium)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      increment();
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration:
                                        const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
                                    child: const Icon(Icons.add, color: AppColors.whiteColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              couponCode == ''
                  ? InkWell(
                      onTap: () async {
                        result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CouponScreen(finalAmount: totalAmount, eventId: ticketProvider.ticketEventId)));

                        if (result != null && result['discountAmount'] != null) {
                          discountAmount = result['discountAmount'].toDouble();
                          couponCode = result['promoCode'];
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getTranslated(context, AppConstant.youHaveCouponToApply).toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.inputTextColor,
                                  fontFamily: AppFontFamily.poppinsMedium),
                            ),
                            Text(
                              getTranslated(context, AppConstant.applyNow).toString(),
                              style: const TextStyle(
                                  fontSize: 14, color: AppColors.blueColor, fontFamily: AppFontFamily.poppinsMedium),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.inputTextColor, width: 0.2)),
                      child: Text(couponCode,
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsMedium)),
                    ),
              const SizedBox(height: 10),
              couponCode != ''
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context, AppConstant.discount).toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFontFamily.poppinsMedium),
                        ),
                        Text(
                          SharedPreferenceHelper.getString(Preferences.currencySymbol) + discountAmount.toString(),
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.inputTextColor, fontFamily: AppFontFamily.poppinsMedium),
                        )
                      ],
                    )
                  : Container(),
              const SizedBox(height: 10),
              ListView.builder(
                  itemCount: ticketProvider.allTax.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticketProvider.allTax[index].name!,
                            style: const TextStyle(
                                fontSize: 14, color: AppColors.blackColor, fontFamily: AppFontFamily.poppinsMedium),
                          ),
                          Text(
                            SharedPreferenceHelper.getString(Preferences.currencySymbol) +
                                ticketProvider.allTax[index].price!.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFontFamily.poppinsMedium),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (widget.isSeatMapModuleInstalled == 1) {
            // TODO: Seat Mapping Module: Uncomment Following if you want to add this module
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => SeatingScreen(
            //       eventId: ticketProvider.ticketEventId,
            //       ticketId: ticketProvider.ticketId,
            //       quantity: quantity,
            //       payment: couponCode != '' ? totalAmount - int.parse(discountAmount.toInt().toString()) : totalAmount,
            //       tax: ticketProvider.totalTax.toDouble(),
            //       couponDiscount: discountAmount,
            //       moduleInstall: widget.isSeatMapModuleInstalled,
            //       seatMapId: widget.seatMapId!,
            //     ),
            //   ),
            // );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentGateway(
                  payment: int.parse(totalAmount.round().toString()),
                  eventId: ticketProvider.ticketEventId,
                  quantity: quantity,
                  couponDiscount: discountAmount,
                  ticketId: ticketProvider.ticketId,
                  tax: ticketProvider.totalTax.toDouble(),
                ),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 05, right: 05, bottom: 05),
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: AppColors.primaryColor),
          child: Text(getTranslated(context, AppConstant.continueKey).toString() + " ${totalAmount - discountAmount}",
              style:
                  const TextStyle(fontSize: 16, color: AppColors.whiteColor, fontFamily: AppFontFamily.poppinsMedium)),
        ),
      ),
    );
  }
}
