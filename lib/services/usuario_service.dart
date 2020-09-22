import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => _usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('Profesion ${_usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
