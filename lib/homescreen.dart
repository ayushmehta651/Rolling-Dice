import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //when we have to use more than 1 animation we use : TickerProviderStateMixin
  //else : SingleTickerProviderStateMixin

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    //it is not called when app is reloaded
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    //To move the controller we have two properties forward and reverse
    //_controller.forward();
    animation.addListener(() {
      setState(() {});
      // print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        //print('completed');
        _controller.reverse();
        // _controller.addStatusListener((status) {
        //   if (status == AnimationStatus.dismissed) print('done!');
        // });
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dicee'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onDoubleTap: roll, //(){roll();} (call back function)
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(
                        height: 200 - (animation.value * 200),
                        image: AssetImage(
                            'assets/images/dice-png-$leftDiceNumber.png')),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: roll,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(
                        height: 200 - (animation.value * 200),
                        image: AssetImage(
                            'assets/images/dice-png-$rightDiceNumber.png')),
                  ),
                ),
              )
            ],
          ),
          RaisedButton(
            onPressed: roll,
            hoverColor: Colors.blue,
            child: Text(
              'Roll Dice',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
