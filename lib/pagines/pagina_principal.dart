import 'package:exemple_aplicacio_tasques/components/dialog_nova_tasca.dart';
import 'package:exemple_aplicacio_tasques/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List tasquesLlista = [
    {"titol": "Tasca 1", "valor": false},
    {"titol": "Tasca 2", "valor": false},
    {"titol": "Tasca 3", "valor": true},
  ];

  TextEditingController tecTextTasca = TextEditingController();
  
  void accioGuardar() {
    setState(() {
      tasquesLlista.add({
      "titol": tecTextTasca.text, 
      "valor": false,
      });
    });
    accioCancelar();
  }

  void accioCancelar() {
    Navigator.of(context).pop();
    tecTextTasca.clear();
  }

  void canviaCheckbox(bool valorCheckBox, int posLlista) {
    setState(() {
      tasquesLlista[posLlista]["valor"] = !tasquesLlista[posLlista]["valor"];
    });
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      tasquesLlista.removeAt(posLlista);
    });
  }

  void crearNovaTasca() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogNovaTasca(
          tecTextTasca: tecTextTasca, 
          accioGuardar: accioGuardar, 
          accioCancelar: accioCancelar,
        );
      }
    );
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Tasques"),
        foregroundColor: Colors.white,
      ),

      //FloatActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNovaTasca,
        child: Icon(Icons.add, color: Colors.white),
      ),

      //Body
      body: ListView.builder(
        itemCount: tasquesLlista.length,
        itemBuilder: (context, index) {
          return ItemTasca(
            textTasca: tasquesLlista[index]["titol"],
            valorCheckBox: tasquesLlista[index]["valor"],
            canviarValocrCheckBox: (valor) => canviaCheckbox(
              tasquesLlista[index]["valor"],
              index,
            ),
            esborrarTasca: (valor) => accioEsborrarTasca(index),
          );
        },
      ),
    );
  }
}
