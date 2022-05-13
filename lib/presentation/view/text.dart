import 'package:flutter/material.dart';

class TextBold extends StatelessWidget {
  final String _text;
  final double _textSize;
  final Color _textColor;
  final int maxLines;

  const TextBold(this._text, this._textSize, this._textColor,
      {Key? key, this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: _textColor, //Color.fromRGBO(28, 28, 28, 1.0),
        fontSize: _textSize,
        fontFamily: 'Arial',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextRegular extends StatelessWidget {
  final String _text;
  final double _textSize;
  final Color _textColor;
  final int maxLines;

  const TextRegular(this._text, this._textSize, this._textColor,
      {Key? key, this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: _textColor, //Color.fromRGBO(28, 28, 28, 1.0),
        fontSize: _textSize,
        fontFamily: 'Arial',
        //fontWeight: FontWeight.bold,
      ),
    );
  }
}
