import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class Appearance extends StatefulWidget {
  const Appearance({Key? key}) : super(key: key);

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  bool _primerBotonHundido = false;
  bool _segundoBotonHundido = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text('Appearance', style: TextStyle(fontSize: 25)),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            /// Botones de la parte superior
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _primerBotonHundido = true;
                          _segundoBotonHundido = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        elevation: _primerBotonHundido ? 10 : 2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _primerBotonHundido = false;
                          _segundoBotonHundido = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.mainGreen.withOpacity(0.8),
                        elevation: _segundoBotonHundido ? 5 : 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.horizontal(right: Radius.circular(10)),
                        ),
                      ),
                      child: const Icon(
                        Icons.nightlight_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            /// Theme colors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Theme colors",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: const [
                    ColoredBox(color: Colors.red),
                    ColoredBox(color: Colors.blue),
                    ColoredBox(color: Colors.green),
                    ColoredBox(color: Colors.yellow),
                    ColoredBox(color: Colors.purple),
                    ColoredBox(color: Colors.orange),
                    ColoredBox(color: Colors.pink),
                    ColoredBox(color: Colors.brown),
                    ColoredBox(color: Colors.teal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
