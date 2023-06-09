import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pin put auto fill'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => debugPrint(pin),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 16,
      color: Color.fromRGBO(1, 28, 111, 1.0),
      fontWeight: FontWeight.w600,),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(168, 113, 136, 1.0,),),
    borderRadius: BorderRadius.circular(10),
  ),
);

final focusedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: const Color.fromRGBO(194, 8, 99, 1.0),
    borderRadius: BorderRadius.circular(15),
  ),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: const Color.fromRGBO(132, 46, 72, 1.0),
    borderRadius: BorderRadius.circular(10),
  ),
);
