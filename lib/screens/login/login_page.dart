import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.darkGray,
      resizeToAvoidBottomInset:
          false, // agregado para evitar el desbordamiento inferior
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Center(
              child: Image.asset(
                'assets/icons/logo_prueba.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                color: Color(0xFFE19507),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: const TextStyle(color: MyColors.darkGray),
                          /*icon: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.person, size: 35),
                          ),*/
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: const Icon(Icons.person, size: 35, color: MyColors.darkGray,),
                          ),
                          iconColor: MyColors.darkGray,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                          /*
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.pink),
                          ),
                          */
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: MyColors.darkGray),
                          /*icon: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Icon(Icons.lock, size: 35),
                          ),*/
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: const Icon(Icons.lock, size: 35, color: MyColors.darkGray,),
                          ),
                          iconColor: MyColors.darkGray,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                          /*
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.pink),
                          ),
                          */
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home'); // Cambiar a pushReplacementNamed
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: const Color(0xFFD3D1D1),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          elevation: 2,
                        ),
                        child: const Text("Login", style: TextStyle(color: MyColors.darkGray, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
