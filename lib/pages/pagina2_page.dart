import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            if (snapshot.hasData) {
              return Text('${snapshot.data.nombre}');
            } else if (usuarioService.usuario != null) {
              return Text(usuarioService.usuario.nombre);
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
                usuarioService.cargarUsuario(
                    Usuario(nombre: 'Pablo', edad: 44, profesiones: []));
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
