import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

const String _TITLE = 'DottedLine Demo';

void main() => runApp(const Page2());

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _TITLE,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 400, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.5,
              lineThickness: 14,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 34,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 14,  /// MEDIO
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 20,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 34,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 14,
            ),
            Text(
              ' OR CONTINUE WITH  ',
              style: TextStyle(
                color: Color(0xBD222223),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.5,
              lineThickness: 14,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 34,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 14,  /// MEDIO
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.4,
              lineThickness: 20,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3.3,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3,
              lineThickness: 34,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3,
              lineThickness: 24,
            ),
            DottedLine(
              dashColor: Color(0xBD222223),
              lineLength: 6,
              dashLength: 3,
              lineThickness: 14,
            ),
            /*
            Text("·",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xBD222223),
                  fontWeight: FontWeight.bold,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
