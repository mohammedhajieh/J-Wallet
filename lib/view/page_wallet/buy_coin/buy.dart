import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';

class CreditCardsPage extends StatefulWidget {
  const CreditCardsPage({super.key});

  @override
  State<CreditCardsPage> createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2.w,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Buy Coin'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CreditCardWidget(
                glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: 'Credit Card',
                frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                showBackView: isCvvFocused,
                obscureCardNumber: false,
                obscureCardCvv: false,
                isHolderNameVisible: true,
                cardBgColor: Colors.blue.shade900,
                backgroundImage:
                    useBackgroundImage ? 'assets/image/card_bg (1).png' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: [
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/image/mastercard (2).png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  errorStyle: TextStyle(fontSize: 12.sp),
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  errorStyle: TextStyle(fontSize: 12.sp),
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  errorStyle: TextStyle(fontSize: 12.sp),
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelText: 'Card Holder',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.w,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  errorStyle: TextStyle(fontSize: 12.sp),
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Glassmorphism',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: useGlassMorphism,
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue.shade900,
                      onChanged: (bool value) => setState(() {
                        useGlassMorphism = value;
                      }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Card Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: useBackgroundImage,
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue.shade900,
                      onChanged: (bool value) => setState(() {
                        useBackgroundImage = value;
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: _onValidate,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(23.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Validate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      // ignore: avoid_print
      print('valid!');
      Navigator.pushNamed(context, 'amount').then(
        (value) {
          setState(() {
            // walletCoin();
          });
        },
      );
    } else {
      // ignore: avoid_print
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
