import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_organizado/Business_logic/Blocs/bloc/login/login_bloc.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/RberUserCredentials/rememberusercredentials_cubit.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/checkboxcubit/checkboccubit_cubit.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/validationfields_cubit.dart';
import 'package:gym_organizado/Constants/validations.dart';
import 'package:gym_organizado/UI/Screens/admin_dashboard.dart';
import 'package:gym_organizado/UI/Widgets/custom_buttom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<RememberUserCredentialsCubit>(context).state.email !=
        "") {
      context.read<ValidationfieldsCubit>().validateEmailField(true);
      context.read<ValidationfieldsCubit>().validatePasswordField(true);
      context.read<CheckBoxCubitCubit>().setCheckToPressed(true);
    }
  }

  final _formkey = GlobalKey<FormState>();
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final TextEditingController emailController = TextEditingController(
      text: BlocProvider.of<RememberUserCredentialsCubit>(context).state.email,
    );
    final TextEditingController passwordController = TextEditingController(
      text:
          BlocProvider.of<RememberUserCredentialsCubit>(context).state.password,
    );

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            Navigator.pop(context);
            ElegantNotification.error(
                    title: const Text("Error"),
                    animation: AnimationType.fromTop,
                    toastDuration: const Duration(milliseconds: 4000),
                    description: Text(state.message))
                .show(context);
          }
          if (state is LoginLoading) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
          if (state is LoginSuccess) {
            Navigator.pop(context);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AdminDashboard())));
            ElegantNotification.success(
                    title: const Text("Exito"),
                    animation: AnimationType.fromTop,
                    toastDuration: const Duration(milliseconds: 2000),
                    description: const Text('Bienvenido'))
                .show(context);
          }
        },
        child: SingleChildScrollView(
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
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child:
                      BlocBuilder<ValidationfieldsCubit, ValidationfildsState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            maxLines: 1,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                emailValidation(value: value, context: context),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check_circle,
                                  color: state.isEmailValidated
                                      ? Colors.green
                                      : const Color.fromRGBO(
                                          150, 152, 154, 0.5)),
                              label: const Text('Entrar Email'),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextFormField(
                            controller: passwordController,
                            maxLines: 1,
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => passwordValidation(
                                context: context, value: value),
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check_circle,
                                  color: state.isPasswordValidated
                                      ? Colors.green
                                      : const Color.fromRGBO(
                                          150, 152, 154, 0.5)),
                              label: const Text('Entrar Contrseña'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 140),
                            child: Row(
                              children: [
                                BlocBuilder<CheckBoxCubitCubit,
                                    CheckBoxCubitState>(
                                  builder: (context, state) {
                                    return Checkbox(
                                      activeColor:
                                          const Color.fromRGBO(77, 82, 233, 1),
                                      value: context
                                          .read<CheckBoxCubitCubit>()
                                          .state
                                          .isPressed,
                                      onChanged: (value) {
                                        if (value! == true) {
                                          context
                                              .read<CheckBoxCubitCubit>()
                                              .setCheckToPressed(value);
                                        } else {
                                          context
                                              .read<CheckBoxCubitCubit>()
                                              .setCheckToNotPressed(value);
                                        }
                                      },
                                    );
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
                              FocusScope.of(context).unfocus();
                              if (_formkey.currentState?.validate() ?? false) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginButtonPressed(
                                        email: emailController.text,
                                        password: passwordController.text));

                                /** Navegar */
                              } else {}
                            },
                            title: "Acceder",
                          )
                        ],
                      );
                    },
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
