import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsuarioBloc, UsuarioState>(
          builder: (context, state) {
            return state.usuario != null
                ? Text('${state.usuario.nombre} , ${state.usuario.edad}')
                : Text('Pagina 2');
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
                final usuario = Usuario(
                    nombre: 'Pablo',
                    edad: 44,
                    profesiones: ['FullStack', 'Frontend']);

                BlocProvider.of<UsuarioBloc>(context).add(
                  ActivarUsuario(usuario),
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
                BlocProvider.of<UsuarioBloc>(context).add(CambiarEdad(30));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Anadir profesion',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context)
                    .add(AgregarProfesion('Nueva profesion'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
