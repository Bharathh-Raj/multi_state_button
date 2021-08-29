import 'package:flutter/material.dart';
import 'package:multi_state_button/multi_state_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MultiStateButtonController multiStateButtonController;

  @override
  void initState() {
    multiStateButtonController = MultiStateButtonController(initialStateName: "Submit");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi State Button Example",
      home: Scaffold(
        appBar: AppBar(title: const Text("Multi State Button Example")),
        body: Center(
          child: MultiStateButton(
            buttonStates: [
              ButtonState(
                  stateName: "Submit",
                  child: Text(
                    "Submit",
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  size: Size(160, 48),
                  boxDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0x66666666),
                        blurRadius: 4.0,
                        spreadRadius: 3.0,
                        offset: Offset(0, 2.0),
                      )
                    ],
                  ),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Loading";
                  }),
              ButtonState(
                  stateName: "Loading",
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  boxDecoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                  ),
                  size: Size(160, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Loading2";
                  }),
              ButtonState(
                  stateName: "Loading2",
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  boxDecoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                  ),
                  size: Size(160, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Try Again";
                  }),
              ButtonState(
                  stateName: "Try Again",
                  boxDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0x66666666),
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                        offset: Offset(0, 6.0),
                      )
                    ],
                  ),
                  child: Text(
                    "Try Again",
                  ),
                  size: Size(160, 48),
                  textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Error";
                  }),
              ButtonState(
                  stateName: "Error",
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Error",
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.error_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  boxDecoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  size: Size(160, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Success";
                  }),
              ButtonState(
                  stateName: "Success",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Success",
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    ],
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 22),
                  boxDecoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color(0x66666666),
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                        offset: Offset(0, -3.0),
                      )
                    ],
                  ),
                  size: Size(160, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Submit";
                  }),
            ],
            multiStateButtonController: multiStateButtonController,
          ),
        ),
      ),
    );
  }
}
