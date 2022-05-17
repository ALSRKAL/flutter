import 'package:doctor/screens/singin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../widget/colors.dart';
import 'getxphoneAuth/getx.dart';
class OtpScreen extends StatefulWidget {
  static const String id = 'otp_screen';

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  
  final String _selectedlang = 'en';

  final Otpcontroller = TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listenOtp();
  }
  void _listenOtp()async{
   await SmsAutoFill().listenForCode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SmsAutoFill().unregisterListener();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Verify Phone'.tr,
          style: const TextStyle(color: kfont),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        
      ),
      body: GetBuilder<phoneAuthCrt>(
        init: phoneAuthCrt(),
        builder: (Value) => Center(
          child: Column(
            children: [
              const Expanded(
                child: Image(
                  image: AssetImage('images/otp.gif'),
                ),
              ),
              Text(
                'Phone Number Verification'.tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kfont
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter the code sent to'.tr,
                      style: const TextStyle(
                        fontSize: 15,
                        color: kfont
                      )),
                      TextButton(onPressed: (){Get.offNamedUntil(SingiIn.id, ((route) => false));}, child: Text(Value.result,style: const TextStyle(
                        fontSize: 15,
                      )),)
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow:const  [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 0.0,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(221, 65, 63, 63))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: kprimryColors,
                ),
                child: Column(
                  children: [
                     PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                ),
                
                onCodeChanged: (code) {
                  print(code);
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Value.verify(code, context);
                  }
                },
                
              ),
                     
                    const SizedBox(height: 20),

                    // PinCodeTextField(
                    //     onCompleted: (value) => Value.verify(value, context),
                    //     appContext: context,
                    //     length: 6,
                    //     keyboardType: TextInputType.number,
                    //     controller: Otpcontroller,
                    //     pinTheme: PinTheme(
                    //         borderRadius: BorderRadius.circular(5),
                    //         shape: PinCodeFieldShape.box,
                    //         fieldHeight: 50,
                    //         fieldWidth: 40,
                    //         inactiveColor: Colors.red),
                    //     onChanged: (value) {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive the code?".tr,style:const TextStyle(color: kfont),),
                        Value.wait.value
                            ? TextButton(
                                onPressed: () async {
                                  Value.fetchotp(context);

                                  Value.resend.value = 'Sms sent'.tr;
                                  Value.wait.value = false;
                                },
                                child: Text(Value.resend.value.tr))
                            : Text(Value.resend.value,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    // MaterialButton(
                    //   elevation: 3,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30, vertical: 10),
                    //   color: kappbar,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: Text(
                    //     'VERIFY'.tr,
                    //     style: const TextStyle(color: kprimryColors),
                    //   ),
                    //   onPressed: () async {
                    //     Value.verify(Otpcontroller.text, context);
                    //   },
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
