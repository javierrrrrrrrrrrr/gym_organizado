import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gym_organizado/Business_logic/Blocs/bloc/internet/bloc/internet_bloc.dart';
import 'package:gym_organizado/Business_logic/Blocs/bloc/login/login_bloc.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/RberUserCredentials/rememberusercredentials_cubit.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/checkboxcubit/checkboccubit_cubit.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/validationfields_cubit.dart';
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
                BlocProvider<RememberUserCredentialsCubit>(
                  create: (context) => RememberUserCredentialsCubit(),
                ),
                BlocProvider<CheckBoxCubitCubit>(
                  create: (context) => CheckBoxCubitCubit(),
                ),
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(
                      checkBoxCubitCubit: context.read<CheckBoxCubitCubit>(),
                      rememberusercredentialsCubit:
                          BlocProvider.of<RememberUserCredentialsCubit>(
                              context),
                      userRepository:
                          RepositoryProvider.of<AuthRepository>(context),
                      internetBloc: BlocProvider.of<InternetBloc>(context)),
                ),
                BlocProvider<ValidationfieldsCubit>(
                  create: (context) => ValidationfieldsCubit(),
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
      home: const LoginPage(),
      theme: tema,
    );
  }
}
