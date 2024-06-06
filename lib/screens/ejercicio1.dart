import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prueba_fluter_1/screens/ejercicio2.dart';

void main (){
  runApp(Ejercicio1());
}

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
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
     /////////////
    List <Widget> screens=[
      Cuerpo(context,
      )
    ];
    ///
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio01'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
        decoration: const BoxDecoration( 
      image: DecorationImage( 
        image: NetworkImage("https://images3.alphacoders.com/132/1322308.jpeg"),
        fit: BoxFit.cover
       )
        ),
    child: (
      Column(
        children: [
        Text("Ejercicio /Lanzamiento"),
        AlturaI(context),
        Tiempo(context),
        BtnIniciar(context),
        btnSiguiente(context)
      ],)
    ),
  );
}

final TextEditingController _alturai = TextEditingController();
final TextEditingController _tiempo = TextEditingController();
Widget AlturaI(context){
  return(
    TextField(
      controller: _alturai,
      decoration:InputDecoration(hintText: "Ingresa una altura inicial"),
      keyboardType: TextInputType.number,
    )
  );
}
Widget Tiempo(context){
  return(
    TextField(controller: _tiempo,
   decoration: InputDecoration(
    hintText:"Ingregse tiempo estimado"),
    keyboardType: TextInputType.number, )
  );
}

Widget BtnIniciar(context){
        return(
        ElevatedButton(onPressed: (){
              calcular(context);
        }, child: Text("Iniciar conteo"))
      );
}

void calcular(context){
  double alturai = double.tryParse(_alturai.text)?? 0.0;
  double tiempoi = double.tryParse(_tiempo.text)?? 0.0;
  double altura = alturai+ (1/2 * 20 * pow(tiempoi, 2));
  print("Texttoooo ${altura}");
  if (altura >= 1000) {
   showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("LAZAMIENTO EXITOSO"),
      content: Text("Su altura es de: ${altura}"),
    );
  });
  } else {
    showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("LAZAMIENTO FALLIDO"),
      content: Text("Altura insuficiente: ${altura}"),
    );
  });
  }
}
Widget btnSiguiente (context){
  return(
    ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Aplicacion2()));
    }, child: Text("Siguiente ejercicio"))
  );
}