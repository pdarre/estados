import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Consumer<UsuarioService>(
          builder: (context, value, child) {
            if (value.usuario != null) {
              return Text('${value.usuario.nombre}, ${value.usuario.edad}');
            }
            return Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.usuario = Usuario(
                  nombre: 'Pablo',
                  edad: 44,
                  profesiones: [
                    'Fullstack Developer',
                    'Video jugador',
                    'Fronend developer'
                  ],
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Anadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
