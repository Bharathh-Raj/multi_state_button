import 'package:flutter/material.dart';
import 'package:multi_state_button/multi_state_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _submit = "Submit";
  static const String _loading = "Loading";
  static const String _tryAgain = "Try Again";
  static const String _error = "Error";
  static const String _block = "Block";
  static const String _success = "Success";
  static const String _tick = "Tick";
  final MultiStateButtonController multiStateButtonController = MultiStateButtonController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi State Button Example",
      home: Scaffold(
        appBar: AppBar(title: const Text("Multi State Button Example")),
        body: Center(
          child: MultiStateButton(
            multiStateButtonController: multiStateButtonController,
            buttonStates: [
              ButtonState(
                  stateName: _submit,
                  child: Text(
                    _submit,
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                  size: Size(160, 48),
                  decoration: BoxDecoration(
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
                    multiStateButtonController.setButtonState = _loading;
                  }),
              ButtonState(
                  stateName: _loading,
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
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                  ),
                  size: Size(48, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _tryAgain;
                  }),
              ButtonState(
                  stateName: _tryAgain,
                  decoration: BoxDecoration(
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
                    _tryAgain,
                  ),
                  size: Size(160, 48),
                  textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _error;
                  }),
              ButtonState(
                  stateName: _error,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _error,
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
                  textStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                  size: Size(180, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _success;
                  }),
              ButtonState(
                  stateName: _success,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _success,
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
                  decoration: BoxDecoration(
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
                  size: Size(200, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _block;
                  }),
              ButtonState(
                  stateName: _block,
                  child: Icon(
                    Icons.block,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  size: Size(48, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _tick;
                  }),
              ButtonState(
                  stateName: _tick,
                  child: Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.cyan.withOpacity(0.5),
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                  size: Size(48, 48),
                  onPressed: () {
                    multiStateButtonController.setButtonState = _submit;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
