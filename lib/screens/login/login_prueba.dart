import 'package:Sound2U/styles/colors.dart';
import 'package:Sound2U/widgets/input_text.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  final bool _obscureText = true;

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //final email = _emailController.text.trim();
      //final password = _passwordController.text.trim();

      final email = _email.trim();
      final password = _password.trim();

      // Agregar Login AQUI
      print("Email: " + email);
      print("Password: " + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: 450,
            height: constraints.maxHeight > 800
                ? MediaQuery.of(context).size.height * 0.9
                : null,
            child: Container(
              color: MyColors.orange,
              padding: const EdgeInsets.all(50),
              child: Form(
                key: _formKey,
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Start sharing \nyour music',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(color: Colors.transparent, height: 30),
                    InputText(
                      label: 'Email',
                      icon: const Icon(Icons.email),
                      keyboard: TextInputType.emailAddress,
                      onChanged: (data) {
                        _email = data;
                      },
                      validator: (data) => data == null || data.isEmpty
                          ? 'Por favor ingrese su correo electrónico'
                          : !data.contains('@') || !data.contains('.')
                              ? 'Por favor ingrese un correo electrónico válido'
                              : null,
                    ),
                    const Divider(color: Colors.transparent, height: 20),
                    InputText(
                      label: 'Password',
                      obscureText: true,
                      showPassword: true,
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: MyColors.darkGray,
                      ),
                      onChanged: (data) {
                        _password = data;
                      },
                      validator: (data) {
                        if (data!.trim().length < 8) {
                          return 'Invalid password';
                        }
                        return null;
                      },
                    ),
                    const Divider(color: Colors.transparent, height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.5),
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {
                                  //setState(() => _rememberMe = value!);
                                },
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(color: Colors.transparent, height: 20),
                    ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Listen in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*

                    /*TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Por favor ingrese su correo electrónico'
                          : !value.contains('@') || !value.contains('.')
                              ? 'Por favor ingrese un correo electrónico válido'
                              : null,
                      onFieldSubmitted: (_) => _submitForm(context),
                    ),
                    const SizedBox(height: 20),                    */

                    /*TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.lock),
                          tooltip:
                              'Debe tener al menos 8 caracteres y \ndebe contener al menos un número',
                          onPressed: () {},
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Por favor ingrese su contraseña'
                          : value.length < 8
                              ? 'La contraseña debe tener al menos 8 caracteres'
                              : !RegExp(r'.*\d+.*').hasMatch(value)
                                  ? 'La contraseña debe contener al menos un número'
                                  : null,
                      onFieldSubmitted: (_) => _submitForm(context),
                    ),*/
 */
