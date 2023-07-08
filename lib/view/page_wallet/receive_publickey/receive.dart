import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';
import 'package:j_wallet/view/import_wallet/importwallet_body.dart';
import 'package:j_wallet/view/login_account/login_body.dart';
import 'package:j_wallet/view/secret_phrase/secretphrase_body.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePublicKey extends StatefulWidget {
  const ReceivePublicKey({super.key});

  @override
  State<ReceivePublicKey> createState() => _ReceivePublicKeyState();
}

final TextEditingController controller = TextEditingController();

class _ReceivePublicKeyState extends State<ReceivePublicKey> {
  @override
  void initState() {
    super.initState();
    if (address.isNotEmpty) {
      controller.text = address;
    } else if (addressImpoart.isNotEmpty) {
      controller.text = addressImpoart;
    } else {
      controller.text = getaddressLogin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Receive'),
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: ListView(
              children: [
                Center(
                  child: QrImageView(
                    data: controller.text,
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextField(
                  controller: controller,
                  readOnly: true,
                  onChanged: (value) {
                    setState(() {
                      controller.text = value;
                    });
                  },
                  onSubmitted: (value) {
                    setState(() {
                      controller.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: controller.text),
                          ).then(
                            (value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  '✓  public address copied to clipboard',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.blue.shade900,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(milliseconds: 500),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 50.h),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r)),
                              ));
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.white,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.w,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16.sp,
                    ),
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
