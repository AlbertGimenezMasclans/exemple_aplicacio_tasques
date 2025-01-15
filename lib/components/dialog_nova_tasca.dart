import 'package:exemple_aplicacio_tasques/components/boto_dialog.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  final TextEditingController tecTextTasca;
  final Function()? accioGuardar;
  final Function()? accioCancelar;
  const DialogNovaTasca({
    super.key,
    required this.tecTextTasca,
    required this.accioGuardar,
    required this.accioCancelar,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: tecTextTasca,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                hintText: "Escriu una nova tasca...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.teal[200],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotoDialog(
                  textBoto: "Guardar", 
                  accioBoto: accioGuardar,
                ), //Botó guardar
                BotoDialog(
                  textBoto: "Cancelar", 
                  accioBoto: accioCancelar,
                ), //Botó cancelar
              ],
            )
          ],
        ),
      ),
    );
  }
}