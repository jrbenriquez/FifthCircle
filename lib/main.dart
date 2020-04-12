import 'package:audioplayers/audio_cache.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(FifthCircle());

class FifthCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final defaultState = 1;
  final maxState = 2;
  int chartState = 1;

  String selectedNote;
  String header = 'Major Keys';
  String centerTextFocus = 'Relative Minor';

  void playNote(String noteName) {
    final player = AudioCache();
    // Change ♭ to b
    noteName = noteName.replaceAll('♭', 'b');
    player.play('$noteName.wav');
  }

  var majorKeys = [
    'C',
    'G',
    'D',
    'A',
    'E',
    'B',
    'G♭',
    'D♭',
    'A♭',
    'E♭',
    'B♭',
    'F'
  ];

  var relativeMinorKeys = [
    'A',
    'E',
    'B',
    'F#',
    'C#',
    'G#',
    'E♭',
    'B♭',
    'F',
    'C',
    'G',
    'D'
  ];

  PieChartSectionData circleSection({Color color, String title}) {
    return PieChartSectionData(
      value: 1,
      color: color,
      radius: title == selectedNote ? 100 : 80,
      title: title,
      titleStyle: chartSectionTextStyle(),
    );
  }

  TextStyle chartSectionTextStyle() {
    return TextStyle(
      color: Colors.grey[800],
      fontSize: 20,
    );
  }

  PieChart fifthsChart() {
    return PieChart(
      PieChartData(
          // read about it in the below section
          pieTouchData: PieTouchData(
            enabled: true,
            touchCallback: (pieTouchResponse) {
              setState(() {
                if (pieTouchResponse.touchInput is FlPanStart) {
                  playNote(pieTouchResponse.touchedSection.title);
                  selectedNote = pieTouchResponse.touchedSection.title;
                }
              });
            },
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 120,
          centerSpaceColor: Colors.transparent,
          borderData: FlBorderData(
            show: false,
          ),
          startDegreeOffset: -105,
          sections: [
            circleSection(
              color: Colors.red[200],
              title: majorKeys[0],
            ),
            circleSection(
              color: Colors.deepOrangeAccent[100],
              title: majorKeys[1],
            ),
            circleSection(
              color: Colors.orange[200],
              title: majorKeys[2],
            ),
            circleSection(
              color: Colors.yellow[200],
              title: majorKeys[3],
            ),
            circleSection(
              color: Colors.lightGreen[300],
              title: majorKeys[4],
            ),
            circleSection(
              color: Colors.green[300],
              title: majorKeys[5],
            ),
            circleSection(
              color: Colors.teal[300],
              title: majorKeys[6],
            ),
            circleSection(
              color: Colors.lightBlue[300],
              title: majorKeys[7],
            ),
            circleSection(
              color: Colors.blue[400],
              title: majorKeys[8],
            ),
            circleSection(
              color: Colors.deepPurple[300],
              title: majorKeys[9],
            ),
            circleSection(
              color: Colors.purple[200],
              title: majorKeys[10],
            ),
            circleSection(
              color: Colors.pink[200],
              title: majorKeys[11],
            ),
          ]),
    );
  }

  PieChart relativeMinorChart() {
    return PieChart(
      PieChartData(
          // read about it in the below section
          pieTouchData: PieTouchData(
            enabled: true,
            touchCallback: (pieTouchResponse) {
              setState(() {
                if (pieTouchResponse.touchInput is FlPanStart) {
                  playNote(pieTouchResponse.touchedSection.title);
                  selectedNote = pieTouchResponse.touchedSection.title;
                }
              });
            },
          ),
          sectionsSpace: 4,
          centerSpaceRadius: 110,
          centerSpaceColor: Colors.transparent,
          borderData: FlBorderData(
            show: false,
          ),
          startDegreeOffset: -105,
          sections: [
            circleSection(
              color: Colors.red[200],
              title: relativeMinorKeys[0],
            ),
            circleSection(
              color: Colors.deepOrangeAccent[100],
              title: relativeMinorKeys[1],
            ),
            circleSection(
              color: Colors.orange[200],
              title: relativeMinorKeys[2],
            ),
            circleSection(
              color: Colors.yellow[200],
              title: relativeMinorKeys[3],
            ),
            circleSection(
              color: Colors.lightGreen[300],
              title: relativeMinorKeys[4],
            ),
            circleSection(
              color: Colors.green[300],
              title: relativeMinorKeys[5],
            ),
            circleSection(
              color: Colors.teal[300],
              title: relativeMinorKeys[6],
            ),
            circleSection(
              color: Colors.lightBlue[300],
              title: relativeMinorKeys[7],
            ),
            circleSection(
              color: Colors.blue[400],
              title: relativeMinorKeys[8],
            ),
            circleSection(
              color: Colors.deepPurple[300],
              title: relativeMinorKeys[9],
            ),
            circleSection(
              color: Colors.purple[200],
              title: relativeMinorKeys[10],
            ),
            circleSection(
              color: Colors.pink[200],
              title: relativeMinorKeys[11],
            ),
          ]),
    );
  }

  PieChart pieSelector() {
    if (chartState == 1) {
      return fifthsChart();
    } else if (chartState == 2) {
      return relativeMinorChart();
    } else {
      return fifthsChart();
    }
  }

  void updateText() {
    if (chartState == 1) {
      setState(() {
        header = 'Major Keys';
        centerTextFocus = 'Relative Minor';
      });
    } else if (chartState == 2) {
      setState(() {
        header = 'Relative Minor Keys';
        centerTextFocus = 'Major';
      });
    }
  }

  void toggleChart() {
    if (chartState < maxState) {
      setState(() {
        chartState += 1;
      });
      updateText();
    } else {
      setState(() {
        chartState = defaultState;
      });

      updateText();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Text('Fifth Circle'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: pieSelector(),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    toggleChart();
                  },
                  child: Container(
                    child: Text('Touch to switch to $centerTextFocus'),
                    padding: EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    header,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
