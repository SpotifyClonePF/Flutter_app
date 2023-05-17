import 'dart:ui';

import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('¿Está seguro de que desea salir?'),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  child: const Text('Salir'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        );
        return exit ?? false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Expanded to add space between the text and top of the screen
                        const Expanded(
                            flex: 1,
                            child:
                                Divider(color: Colors.transparent, height: 10)),

                        /// Welcome text
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'New experience \nGo Dyzr',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 1.4,
                              height:
                                  1.4, // ajusta la separación entre las líneas
                            ),
                          ),
                        ),

                        /// Logo image
                        Expanded(
                            flex: 3,
                            child: Image.asset('assets/icons/logo_no_fondo.png',
                                height: 300)),

                        /// Buttons
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              /// Create an account
                              InkWell(
                                onTap: () =>
                                    {Navigator.pushNamed(context, '/signup')},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: MyColors.mainGreen,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Create an account",
                                        style: TextStyle(
                                            color: Color(0xFF030304),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const Divider(
                                  color: Colors.transparent, height: 20),

                              /// I have an account
                              InkWell(
                                onTap: () =>
                                    {Navigator.pushNamed(context, '/login')},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                        top: BorderSide(
                                            width: 3.0,
                                            color: MyColors.mainGreen),
                                        left: BorderSide(
                                            width: 3.0,
                                            color: MyColors.mainGreen),
                                        right: BorderSide(
                                            width: 3.0,
                                            color: MyColors.mainGreen),
                                        bottom: BorderSide(
                                            width: 3.0,
                                            color: MyColors.mainGreen),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "I have an account",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/privacy');
                  },
                  child: Column(
                    children: const [
                      Divider(color: Colors.transparent, height: 30),
                      Text(
                        'Terms of use    |    Privacy policy',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
