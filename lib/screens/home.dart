import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _faceController = TextEditingController();
  TextEditingController _diceController = TextEditingController();
  int _result = 0;
  String _textResult = "...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virtual Dice", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 40)),
        backgroundColor: Colors.transparent,
        elevation:  0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                    child: TextField(
                      controller: _faceController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.yellow,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Faces",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _diceController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Dice",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                int _f = int.parse(_faceController.text);
                int _d = int.parse(_diceController.text);
                _textResult = "";
                setState(() {
                  if (_d == 1 && _f < 1000) {
                    if(_f == 1) {
                      if(Random().nextInt(2) == 0)
                        _textResult = "Heads";
                      else
                        _textResult = "Tails";
                    }
                    else
                      _textResult = (1+Random().nextInt(_f)).toString();
                  }
                  else if (_d > 1 && _d <= 20 && _f <= 1000) {
                    for (int i=0; i<_d; i++) {
                      _textResult += (1+Random().nextInt(_f)).toString() + " ";
                    }
                  }
                  else
                    _textResult = "Error";
                });
              },
              child: Container(
                child: Text("ROLL", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            ),
            SizedBox(height:  30,),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult, style: TextStyle(fontSize: 52, fontWeight: FontWeight.w400, color: Colors.yellow), textAlign: TextAlign.center,)
              ),
            ),
          ]
        )
      ),
    );
  }
}
