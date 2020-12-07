import 'package:flutter/material.dart';

import 'note.dart';

class NoteList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookAdvisor'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
            return GestureDetector(
              onLongPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Note(NoteMode.Editting)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Book name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                          'Author name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                          'Who advised',
                        style: TextStyle(
                            fontSize: 20,
                        ),
                      ),
                      Container(height: 4,),
                      Text(
                          'Comment',
                        style: TextStyle(
                            color: Colors.grey.shade700
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}