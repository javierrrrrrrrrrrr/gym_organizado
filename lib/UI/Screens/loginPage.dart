import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_organizado/DataLayer/Repositories/authentication_repo.dart';
import 'package:gym_organizado/UI/Widgets/custom_buttom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: height * 0.005),
                height: height * 0.5,
                width: width,
                child: const Hero(
                  tag: 'hero_id',
                  child: Image(
                    image: AssetImage('assets/gym.jpeg'),
                  ),
                )),
            SizedBox(
              height: height * 0.12,
              width: width * 0.45,
              child: const Text(
                'Acceder al panel de Administracion del Gimnasio',
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(
              width: width * 0.8,
              child: Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 1,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          bool isEmail = GetUtils.isEmail(value!);
                          return isEmail
                              ? null
                              : "Debe  entrar un email valido";
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.check_circle),
                          label: Text('Entrar Email'),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextFormField(
                        maxLines: 1,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          bool isBlank = GetUtils.isBlank(value)!;
                          bool isGraterThan =
                              GetUtils.isLengthGreaterThan(value, 5);

                          if (isBlank == true || isGraterThan == false) {
                            return 'La password es incorrecta';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.check_circle),
                          label: Text('Entrar Contrseña'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 140),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color.fromRGBO(77, 82, 233, 1),
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  //  valor = value!;
                                  // loginProvaider.recordarContrasena = value;
                                });
                              },
                            ),
                            const Text(
                              "Recordar contraseña",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CustomButton(
                        width: width * 0.65,
                        height: height * 0.055,
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            final authRepository = AuthRepository();
                            authRepository.loginUser(
                                email: 'adonysva@gmail.com',
                                password: '123456');

                            /** Navegar */
                          } else {}
                        },
                        title: "Acceder",
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _button(
    double height,
    double width,
    BuildContext context,
  ) {
    return GestureDetector(
        child: Container(
          decoration: _boxDecoration(width),
          height: height * 0.055,
          width: width * 0.65,
          child: Center(
            child: Text(
              "Acceder",
              style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 0.8),
                  fontSize: width * 0.065),
            ),
          ),
        ),
        onTap: () async {});
  }

  BoxDecoration _boxDecoration(var width) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(width * 0.025),
      color: const Color.fromRGBO(77, 82, 233, 1),
    );
  }
}
