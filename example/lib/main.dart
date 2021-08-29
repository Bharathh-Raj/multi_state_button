import 'package:flutter/material.dart';
import 'package:multi_state_button/multi_state_button.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final MultiStateButtonController multiStateButtonController;

  @override
  void initState() {
    multiStateButtonController = MultiStateButtonController(initialStateName: "Disabled");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: Scaffold(
        appBar: AppBar(title: const Text(MyApp._title)),
        body: Center(
          child: MultiStateButton(
            buttonStates: [
              ButtonState(
                  stateName: "Normal",
                  child: Text(
                    "Normal",
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 12),
                  size: Size(100, 40),
                  boxDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Loading";
                  }),
              ButtonState(
                  stateName: "Loading",
                  child: Text(
                    "Loading",
                  ),
                  textStyle: TextStyle(color: Colors.red, fontSize: 18),
                  size: Size(100, 40),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "4";
                  }),
              ButtonState(
                  stateName: "4",
                  child: Icon(
                    Icons.account_circle,
                    size: 120,
                  ),
                  boxDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  size: Size(160, 160),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "5";
                  }),
              ButtonState(
                  stateName: "5",
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  boxDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                  ),
                  size: Size(80, 80),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Disabled";
                  }),
              ButtonState(
                  stateName: "Disabled",
                  child: Text(
                    "Disabled",
                  ),
                  size: Size(200, 80),
                  textStyle: TextStyle(color: Colors.white, fontSize: 24),
                  onPressed: () {
                    multiStateButtonController.setButtonState = "Normal";
                  }),
            ],
            multiStateButtonController: multiStateButtonController,
          ),
        ),
      ),
    );
  }
}
