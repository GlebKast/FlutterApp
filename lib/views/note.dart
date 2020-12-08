import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/note_inherited_widget.dart';

enum NoteMode{
  Editing,
  Adding
}

class Note extends StatefulWidget {

  final NoteMode noteMode;
  final int index;

  Note(this.noteMode, this.index);

  @override
  NoteState createState() {
    return new NoteState();
  }
}


class NoteState extends State<Note> {

  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _whoAdvisedController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _bookNameController.text = _notes[widget.index]['BookName'];
      _authorNameController.text = _notes[widget.index]['AuthorName'];
      _whoAdvisedController.text = _notes[widget.index]['WhoAdvised'];
      _commentController.text = _notes[widget.index]['Comment'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add recommended book' : 'Edit recommended book'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _bookNameController,
              decoration: InputDecoration(
                hintText: 'Book name'
              ),
            ),
            TextField(
              controller: _authorNameController,
              decoration: InputDecoration(
                  hintText: 'Author name'
              ),
            ),
            TextField(
              controller: _whoAdvisedController,
              decoration: InputDecoration(
                  hintText: 'Who advised'
              ),
            ),
            Container(height: 7.5,),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                  hintText: 'Comment'
              ),
            ),
            Container(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteAddEditButton('Save', Colors.blue, () {

                    final book = _bookNameController.text;
                    final author = _authorNameController.text;
                    final advisor = _whoAdvisedController.text;
                    final comment = _commentController.text;
                    if(widget?.noteMode == NoteMode.Adding){
                      _notes.add({
                      'BookName' : book,
                      'AuthorName' : author,
                      'WhoAdvised' : advisor,
                      'Comment' : comment
                    });
                  } else if(widget?.noteMode == NoteMode.Editing){
                      _notes[widget.index] = {
                        'BookName' : book,
                        'AuthorName' : author,
                        'WhoAdvised' : advisor,
                        'Comment' : comment
                      };
                    }
                  Navigator.pop(context);
                }),
                Container(height: 15.0,),
                _NoteAddEditButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: _NoteAddEditButton('Delete', Colors.red, () {
                    _notes.removeAt(widget.index);
                    Navigator.pop(context);
                  }),
                )
                : Container()
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
      height: 40,
      minWidth: 80,
      color: _color,
    );
  }
}

