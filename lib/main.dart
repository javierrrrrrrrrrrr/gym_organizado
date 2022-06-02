import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gym_organizado/Business_logic/Login/bloc/internetBloc/internet_bloc.dart';
import 'package:gym_organizado/Business_logic/Login/bloc/loginBloc/login_bloc.dart';
import 'package:gym_organizado/Business_logic/Login/cubit/checkBox/checkbox_cubit.dart';
import 'package:gym_organizado/Business_logic/Login/cubit/fieldValidation/field_validation_cubit.dart';
import 'package:gym_organizado/Business_logic/Login/cubit/loginInUserCredential/loginIn_user_credential_cubit.dart';
import 'package:gym_organizado/DataLayer/Repositories/authentication_repo.dart';

import 'package:gym_organizado/UI/Screens/loginPage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'Constants/themeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
      storage: storage,
      () => runApp(
            RepositoryProvider(
              create: (context) => AuthRepository(),
              child: MultiBlocProvider(providers: [
                BlocProvider<InternetBloc>(
                  lazy: false,
                  create: (context) => InternetBloc(),
                ),
                BlocProvider<LoginInUserCredentialCubit>(
                  create: (context) => LoginInUserCredentialCubit(),
                ),
                BlocProvider<CheckBoxCubit>(
                  create: (context) => CheckBoxCubit(),
                ),
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(
                      checkBoxCubitCubit: context.read<CheckBoxCubit>(),
                      loginInUserCredential:
                          context.read<LoginInUserCredentialCubit>(),
                      userRepository:
                          RepositoryProvider.of<AuthRepository>(context),
                      internetBloc: BlocProvider.of<InternetBloc>(context)),
                ),
                BlocProvider<FieldValidationCubit>(
                  create: (context) => FieldValidationCubit(),
                ),
              ], child: const MyApp()),
            ),
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = CustomTheme.imputTheme(Get.width);
    return MaterialApp(
      title: 'Material App',
      home: LoginPage(
        loginInUserCredential: context.read<LoginInUserCredentialCubit>(),
        fieldvalidation: context.read<FieldValidationCubit>(),
        checkBox: context.read<CheckBoxCubit>(),
      ),
      theme: tema,
    );
  }
}
