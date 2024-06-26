import 'package:flutter/material.dart';
import 'package:prueba_fluter_1/screens/ejercicio1.dart';
import 'package:prueba_fluter_1/screens/ejercicio2.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

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
  int indice=0;
  @override
  Widget build(BuildContext context) {
      List <Widget> screens=[
      Body(context),
      Ejercicio1(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor){
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.adb_sharp), label :"Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.add_to_photos_rounded), label:"Ejercicio 1")
        ],),
    );
  }
}

Widget Body(context) {
  return Container(
    decoration: const BoxDecoration( 
      image: DecorationImage( 
        image: NetworkImage("https://images3.alphacoders.com/132/1322308.jpeg"),
        fit: BoxFit.cover
       )

    ) ,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Andy Narváez"),
        Text("andyjoel357"),
        Ejercicio01(context),
 
        ],
    ),
  );
}

Widget Ejercicio01(context){
return(
  ElevatedButton(onPressed: (){
      Alerta(context);
  }, child: Text("Ir al primer ejercicio"))
);
}

void Alerta(context){
  showDialog(context: context, builder: (context){
  return Container(
    child: AlertDialog(
    title: Text("Ir al ejercicio 01"),
    content: Text("Redirigir al primer ejercicio"),
    actions: <Widget> [
      TextButton(
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Aplicacion2()));
        }, child: Text("Si")),
         TextButton(onPressed: (){
        Navigator.pop(context);
       },child: Text("No"),),
    ] 
  )
  );
  });
}