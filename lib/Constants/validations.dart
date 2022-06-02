import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gym_organizado/Business_logic/Blocs/cubit/validationfields_cubit.dart';

String? passwordValidation(
    {required BuildContext context, required String? value}) {
  bool isBlank = GetUtils.isBlank(value)!;
  bool isGraterThan = GetUtils.isLengthGreaterThan(value, 5);
  context.read<ValidationfieldsCubit>().validatePasswordField(isGraterThan);
  if (isBlank == true || isGraterThan == false) {
    return 'La password es incorrecta';
  }
  return null;
}

String? emailValidation(
    {required String? value, required BuildContext context}) {
  bool isEmail = GetUtils.isEmail(value!);
  BlocProvider.of<ValidationfieldsCubit>(context).validateEmailField(isEmail);
  return isEmail ? null : "Debe  entrar un email valido";
}
