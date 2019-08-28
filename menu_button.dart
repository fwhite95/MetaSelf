import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;


class MenuButton extends StatefulWidget{
  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> with SingleTickerProviderStateMixin{

  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500));
  }


  @override
  Widget build(homeContext) {
    // TODO: implement build
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget{
  RadialAnimation({Key key, this.controller}) :

  //Scale
  scale = Tween<double>(
      begin: 1,
  end: 0.0,
      ).animate(
      CurvedAnimation(
  parent: controller,
  curve: Curves.fastOutSlowIn),
      ),

  //Translation
  translation = Tween<double>(
    begin: 0.0,
    end: 55,
  ).animate(
    CurvedAnimation(parent: controller, curve: Curves.linear),
  ),

  //rotation
  rotation = Tween<double>(
    begin: 0,
    end: 360,
  ).animate(
    CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, .9, curve: Curves.decelerate,),),
  ),

  super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  @override
  Widget build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder){
        return Transform.rotate(
            angle: radians(rotation.value),
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              buildButton(105, 'set', color: Colors.red, icon: Icons.settings),
              buildButton(45, 'add', color: Colors.pink, icon: Icons.add_circle),
              buildButton(-15, 'ex', color: Colors.blue, icon: Icons.error),
              Transform.scale(
                scale: scale.value - 1,
                child: FloatingActionButton(
                  child: Icon(Icons.close),
                  onPressed: _close,
                  backgroundColor: Colors.red,
                  heroTag: 'settings',
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                    child: Icon(Icons.menu),
                    heroTag: 'open',
                    onPressed: _open),
              ),
            ],
          ),
        );
      },
    );
  }


  buildButton(double angle, String tag, {Color color, IconData icon}){
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
      ),
      child: Container(
        child: FloatingActionButton(
          child: Icon(icon),
          backgroundColor: color,
          onPressed: () {
            print('fucking work');
          },
          elevation: 0,
          mini: true,
          heroTag: tag,
        ),
      )
    );

  }

  _open() {
    controller.forward();
  }

  _close(){
    controller.reverse();
  }


}