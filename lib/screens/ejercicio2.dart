import 'package:flutter/material.dart';

void main() {
  runApp(Aplicacion2());
}

class Aplicacion2 extends StatelessWidget {
  const Aplicacion2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/image/fondo.jpg'), fit: BoxFit.cover)),
    child: Column(
      children: [
        Text("Distancia recorrida"),
        VelocidadAngular(),
        BtnCalcular(context)
      ],
    ),
  );
}

final TextEditingController _vAngular = TextEditingController();

Widget VelocidadAngular() {
  return (TextField(
    controller: _vAngular,
    decoration: InputDecoration(hintText: "Ingrese la velocidad Angular"),
  ));
}

Widget BtnCalcular(context) {
  return (FilledButton(
      onPressed: () {
        Alerta(context);
      },
      child: Text("Calcular")));
}

double calcular() {
  double w = double.tryParse(_vAngular.text) ?? 0.0;
  double distancia = w * 25;
  return distancia;
}

void Alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Distancia recorrida:"),
          content: Text("Distancia total: ${calcular()}"),
        );
      });
}
