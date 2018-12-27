import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  static const String _hummingBirdString = 'Hummingbird';
  static int _currentIndex = 0;

  String _textOne = _hummingBirdString.substring(0, _currentIndex);
  String _textTwo =
      _hummingBirdString.substring(_currentIndex, _hummingBirdString.length);

  bool _showPlaceholderAnimation = true;
  String _animation = "Placeholder";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: _buildFloatingActionButton(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_hummingBirdString),
    );
  }

  _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildHummingbirdFlare(),
        _buildHummingbirdText(),
      ],
    );
  }

  _buildHummingbirdText() {
    Timer(
      const Duration(
        milliseconds: 2000,
      ),
      () {
        _getPrintableHummingBirdText();
      },
    );

    return Container(
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: _textOne,
            style: TextStyle(
              color: Colors.black,
              fontSize: 36.0,
            ),
            children: [
              TextSpan(
                text: _textTwo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () {
        setState(
          () {
            _updateAnimations();
          },
        );
      },
    );
  }

  _buildHummingbirdFlare() {
    return Container(
      width: 100.0,
      height: 250.0,
      child: FlareActor(
        "assets/hummingbird.flr",
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        animation: _animation,
      ),
    );
  }

  _updateAnimations() {
    _showPlaceholderAnimation = !_showPlaceholderAnimation;

    if (_showPlaceholderAnimation) {
      _animation = "Placeholder";
    } else {
      _animation = "FlutterToHummingbird";

      Timer(
        const Duration(milliseconds: 100),
        () {
          _getPrintableHummingBirdText();
        },
      );
    }
  }

  _getPrintableHummingBirdText() {
    if (_currentIndex == _hummingBirdString.length + 1) {
      _currentIndex = 0;
      return;
    }

    _textOne = _hummingBirdString.substring(
      0,
      _currentIndex,
    );

    _textTwo = _hummingBirdString.substring(
      _currentIndex,
      _hummingBirdString.length,
    );

    setState(() {
      _currentIndex++;
    });
  }
}
