import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:j_wallet/view/component/custom_appbar.dart';

class TextName extends StatefulWidget {
  const TextName({super.key});

  @override
  State<TextName> createState() => _TextNameState();
}

TextEditingController _name = TextEditingController();
TextEditingController get getName => _name;
final GlobalKey<FormState> _fromState = GlobalKey<FormState>();

class _TextNameState extends State<TextName> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromState,
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Account Name'),
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length > 12) {
                      return 'The name is longer than 12 words';
                    }
                    if (value.isEmpty) {
                      return 'The Name can not be empty';
                    }
                    return null;
                  },
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _name.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        )),
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.w)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.w)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.w,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    setState(() {
                      _name.text = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        var fromData = _fromState.currentState;
                        if (fromData!.validate()) {
                          // ignore: avoid_print
                          print('Valid');
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'goToAccount', (route) => false);
                        } else {
                          // ignore: avoid_print
                          print('Not Valid');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.r),
                          )),
                      child: Text(
                        'Finsh',
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
