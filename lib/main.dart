import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/note_inherited_widget.dart';
import 'package:flutter_app/views/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: 'BookAdvisor',
        home: NoteList(),
      ),
    );
  }
}
