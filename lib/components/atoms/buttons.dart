import 'package:flutter/material.dart';

class Buttons {
  static raised({
    @required VoidCallback onPressed,
    @required String title,
  }) {
    return RaisedButton(
      shape: _createShape(),
      onPressed: onPressed,
      child: Text(title),
    );
  }

  static raisedIcon({
    @required VoidCallback onPressed,
    @required IconData iconData,
    @required String title,
  }) {
    return RaisedButton.icon(
      shape: _createShape(),
      icon: Icon(iconData, color: Colors.white),
      onPressed: onPressed,
      label: Text(title, style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
    );
  }

  static flat({
    @required VoidCallback onPressed,
    @required String title,
  }) {
    return FlatButton(
      child: Text(title),
      onPressed: onPressed,
    );
  }

  static RoundedRectangleBorder _createShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}
