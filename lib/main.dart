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

  int _currentIndex = 0;

  String _textOne;
  String _textTwo;

  bool _showFlarePlaceholder = true;

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
    return Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _updateAnimation(),
        ),
      ),
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () {
        _updateAnimationState();
      },
    );
  }

  _buildFlare() {
    return Container(
      width: 100.0,
      height: 250.0,
      child: FlareActor(
        "assets/hummingbird.flr",
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        animation:
            _showFlarePlaceholder ? "Placeholder" : "FlutterToHummingbird",
      ),
    );
  }

  _buildHummingbirdText() {
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

  _updateAnimationState() {
    setState(() {
      _showFlarePlaceholder = !_showFlarePlaceholder;
    });
  }

  List<Widget> _updateAnimation() {
    if (_showFlarePlaceholder) {
      _initEmptyHummingbirdText();

      return [
        _buildFlare(),
      ];
    } else {
      Timer(const Duration(milliseconds: 125), () {
        _updateHummingbirdText();
      });

      return [
        _buildFlare(),
        _buildHummingbirdText(),
      ];
    }
  }

  _initEmptyHummingbirdText() {
    setState(() {
      _textOne = "";
      _textTwo = "";
    });
  }

  _initHummingbirdText() {
    setState(() {
      _textOne = _hummingBirdString.substring(0, _currentIndex);
      _textTwo = _hummingBirdString.substring(
        _currentIndex,
        _hummingBirdString.length,
      );
    });
  }

  _updateHummingbirdText() {
    if (_currentIndex == _hummingBirdString.length + 1) {
      _currentIndex = 0;
      return;
    }

    _initHummingbirdText();

    setState(() {
      _currentIndex++;
    });
  }
}
