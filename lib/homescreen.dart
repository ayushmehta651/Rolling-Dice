import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void roll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LUDO')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(
                        image: AssetImage(
                            'assets/images/dice-png-$leftDiceNumber.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(
                        image: AssetImage(
                            'assets/images/dice-png-$rightDiceNumber.png'),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                hoverColor: Colors.blue,
                color: Colors.grey[400],
                onPressed: roll,
                child: Text(
                  'Roll Dice',
                  style: (TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Pacifico',
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
