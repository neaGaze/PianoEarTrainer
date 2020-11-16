import 'package:flutter/material.dart';

class ExerciseListTile extends StatefulWidget {
  ExerciseListTile({Key key, this.title, this.subtitle, this.completionPercent})
      : super(key: key);

  final String title;
  final String subtitle;
  final double completionPercent;

  @override
  _ExerciseListTileState createState() => _ExerciseListTileState();
}

class _ExerciseListTileState extends State<ExerciseListTile> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Container(
        height: 80,
        child: ListTile(
          leading: Stack(
            children: <Widget>[
              Positioned(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Icon(Icons.music_note_rounded),
              )),
              Positioned(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
                value: widget.completionPercent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ))
            ],
          ),
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
