import 'package:flutter/material.dart';

class ExerciseLoadCard extends StatefulWidget {
  ExerciseLoadCard(
      {Key key, this.title, this.subtitle, this.completionPercent, this.onTap})
      : super(key: key);

  final String title;
  final String subtitle;
  final double completionPercent;
  final VoidCallback onTap;

  @override
  _ExerciseLoadCardState createState() => _ExerciseLoadCardState();
}

class _ExerciseLoadCardState extends State<ExerciseLoadCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Icon(Icons.music_note_rounded),
                          )),
                      Positioned(
                          left: 0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: widget.completionPercent,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
