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
      backgroundColor: MyColors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: 450,
            height: constraints.maxHeight > 800
                ? MediaQuery.of(context).size.height
                : null,
            child: Container(
              color: MyColors.orange,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      label: 'Email',
                      hint: 'Email',
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
                      hint: 'Password',
                      obscureText: true,
                      icon: const Icon(Icons.lock_outline),
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
                    const Divider(color: Colors.transparent, height: 20),
                    ElevatedButton(
                      onPressed: () => _submitForm(context),
                      child: const Text('Login'),
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
