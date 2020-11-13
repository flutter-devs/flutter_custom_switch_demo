import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


enum _SwitchBoxProps { paddingLeft, color, text, rotation }


class CustomSwitch extends StatelessWidget {
  final bool switched;

  CustomSwitch({this.switched});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_SwitchBoxProps>()
      ..add(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(60.0), 1.seconds)
      ..add(_SwitchBoxProps.color, Colors.red.tweenTo(Colors.blue), 1.seconds)
      ..add(_SwitchBoxProps.text, ConstantTween("OFF"), 500.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween("ON"), 500.milliseconds)
      ..add(_SwitchBoxProps.rotation, (-2 * pi).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_SwitchBoxProps>>(
      control: switched
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
      context, child, MultiTweenValues<_SwitchBoxProps> value) {
    return Container(
      decoration: _outerBoxDecoration(value.get(_SwitchBoxProps.color)),
      width: 100,
      height: 40,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
                padding:
                EdgeInsets.only(left: value.get(_SwitchBoxProps.paddingLeft)),
                child: Transform.rotate(
                  angle: value.get(_SwitchBoxProps.rotation),
                  child: Container(
                    decoration:
                    _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                    width: 30,
                    child: Center(
                        child: Text(value.get(_SwitchBoxProps.text),
                            style: labelStyle)),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25)), color: color);

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    border: Border.all(
      width: 2,
      color: color,
    ),
  );

  static final labelStyle = TextStyle(
      height: 1.3,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.white);
}
