import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum InputOnlyCharacterError {
  empty,
  noLetters,
}


class InputOnlyCharacter extends FormzInput<String, InputOnlyCharacterError> {
  String? _messageError;

  InputOnlyCharacter.pure() : super.pure('');

  InputOnlyCharacter.dirty([String value = '']) : super.dirty(value);

  String? get messageError => "\u26A0 ${this._messageError}";

  Widget? get customMessageError => this.isNotValid
      ? Row(
          children: [
            Icon(
              Icons.info,
              color: Colors.red,
              size: 18,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                this._messageError.toString(),
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        )
      : null;

  @override
  InputOnlyCharacterError? validator(String value) {
    if (value.length == 0) {
      _messageError = "Campo Obligatorio";
      return InputOnlyCharacterError.empty;
    }

    if (!RegExp('^[a-zA-Z\u00C0-\u017F ñÑ]*\$').hasMatch(value)) {
      _messageError = "Solo se permite el ingreso de letras.";
      return InputOnlyCharacterError.noLetters;
    }

    _messageError = null;
    return null;
  }
}
