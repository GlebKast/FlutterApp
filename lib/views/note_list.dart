import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/note_inherited_widget.dart';
import 'note.dart';


class NoteList extends StatefulWidget {

  List<NoteExample> notes;

  NoteList(this.notes);

  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  List<NoteExample> get _notes => widget.notes;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    print(_notes.length);
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookAdvisor'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index){
            return GestureDetector(
              onLongPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Note(NoteMode.Editing, index, _notes))
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _NoteBookName(_notes[index].bookName),
                      _NoteAuthorName(_notes[index].authorName),
                      _NoteWhoAdvised(_notes[index].whoAdvised),
                      Container(height: 4,),
                      _NoteComment(_notes[index].whoAdvised),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _notes.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding, null, _notes))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteBookName extends StatelessWidget {

  final String _bookName;

  _NoteBookName(this._bookName);

  @override
  Widget build(BuildContext context) {
    return Text(
      _bookName,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class _NoteAuthorName extends StatelessWidget {

  final String _authorName;

  _NoteAuthorName(this._authorName);

  @override
  Widget build(BuildContext context) {
    return Text(
      _authorName,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class _NoteWhoAdvised extends StatelessWidget {

  final String _whoAdvised;

  _NoteWhoAdvised(this._whoAdvised);

  @override
  Widget build(BuildContext context) {
    return Text(
      _whoAdvised,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

class _NoteComment extends StatelessWidget {

  final String _comment;

  _NoteComment(this._comment);

  @override
  Widget build(BuildContext context) {
    return Text(
      _comment,
      style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade700
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}