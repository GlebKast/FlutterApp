import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/note_inherited_widget.dart';
import 'package:flutter_app/views/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<NoteExample> notes = List();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookAdvisor',
      home: NoteList(notes),
    );
  }
}