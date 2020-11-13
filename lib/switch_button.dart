import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_custom_switch_demo/custom_switch.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';



class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool enableSwitch = false;

  void _toggle() {
    setState(() {
      enableSwitch = !enableSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Flutter Animated Custom Switch Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: _toggle,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Enable Custom Switch",
                  textScaleFactor: 1.3,
                ),
              ),
              SizedBox(height: 10,),
              CustomSwitch(switched: enableSwitch),

            ],
          ),
        ),
      ),
    );
  }


}

