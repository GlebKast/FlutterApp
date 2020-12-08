import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {

  final notes = [
    {
        'BookName' : 'The Shadow Thief',
        'AuthorName':  'Marc Levy',
        'WhoAdvised': 'Maria',
        'Comment': 'One of must read books of last decade'
    },
    {
      'BookName' : 'The Shadof Thief',
      'AuthorName':  'Marc Levy',
      'WhoAdvised': 'Maria',
      'Comment': 'One of must read books of last decade'
    }

  ];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>());
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }
}
