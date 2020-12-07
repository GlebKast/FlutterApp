import 'package:flutter/material.dart';

enum NoteMode{
  Editting,
  Adding
}

class Note extends StatelessWidget {

  final NoteMode _noteMode;

  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _noteMode == NoteMode.Adding ? 'Add recommended book' : 'Edit recommended book'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Book name'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Author name'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Who advised'
              ),
            ),
            Container(height: 7.5,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Comment'
              ),
            ),
            Container(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteAddEditButton('Save', Colors.blue, () {
                  Navigator.pop(context);
                }),
                Container(height: 15.0,),
                _NoteAddEditButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),

                _noteMode == NoteMode.Editting ?
                Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: _NoteAddEditButton('Delete', Colors.red, () {
                    Navigator.pop(context);
                  }),
                ) : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteAddEditButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteAddEditButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(_text, style: TextStyle(color: Colors.white),),
      height: 45,
      minWidth: 80,
      color: _color,
    );
  }
}

