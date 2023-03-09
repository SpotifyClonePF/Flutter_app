import 'package:Sound2U/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildSocialButton(Widget icon, Color color) {
    return Transform.scale(
      scale: 1.1,
      child: FloatingActionButton(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        onPressed: () {
          // Intent
        },
        child: icon,
      ),
    );
  }

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
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: const Icon(
                              Icons.person,
                              size: 35,
                              color: MyColors.darkGray,
                            ),
                          ),
                          iconColor: MyColors.darkGray,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: MyColors.darkGray),
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: const Icon(
                              Icons.lock,
                              size: 35,
                              color: MyColors.darkGray,
                            ),
                          ),
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: MyColors.darkGray,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          iconColor: MyColors.darkGray,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.darkGray),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        spacing: 40,
                        children: [
                          _buildSocialButton(Image.asset(
                              'assets/icons/google_redondo.png',
                              width: 35),
                              const Color(0xFFFFFFFF)),
                          _buildSocialButton(Image.asset(
                              'assets/icons/twitter.png',
                              width: 50),
                              const Color(0xFF03A9F4)),
                          _buildSocialButton(Image.asset(
                              'assets/icons/faceboook.png',
                              width: 60) ,
                              const Color(0xFF4A6EA9)),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  '/home'); // Cambiar a pushReplacementNamed
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: MyColors.darkGray,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                              elevation: 2,
                            ),
                            child: const Text("LISTEN IN",
                                style: TextStyle(
                                    color: MyColors.orange,
                                    fontWeight: FontWeight.bold)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  '/home'); // Cambiar a pushReplacementNamed
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color(0xFFE19507),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 15,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                              elevation: 0,
                            ),
                            child: const Text("SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
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

/*
ElevatedButton.icon(
    onPressed: () {
      // acción que se realiza al presionar el botón de Facebook
    },
    icon: Image.asset('assets/icons/facebook.png', height: 22, width: 22),
    label: const Text('Facebook', style: TextStyle(fontSize: 16)),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[900], // color de fondo del botón de Facebook
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      //minimumSize: Size(150, 56),
      fixedSize: const Size(140, 55),
    ),
  ),
  ElevatedButton.icon(
    onPressed: () {
      // acción que se realiza al presionar el botón de Google
    },
    icon: Image.asset('assets/icons/google.png', height: 20, width: 20),
    label: const Text('Google', style: TextStyle(fontSize: 16)),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red[900], // color de fondo del botón de Google
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      fixedSize: const Size(140, 55),
    ),
  ),
 */
