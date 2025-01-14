import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatelessWidget {
  final String textTasca;
  final bool valorCheckBox;
  final Function(bool?)? canviarValocrCheckBox;
  final Function(BuildContext)? esborrarTasca;
  const ItemTasca({
    super.key,
    required this.textTasca,
    required this.valorCheckBox,
    required this.canviarValocrCheckBox,
    required this.esborrarTasca,
  });

  void funcioPelCheckbox(bool valor) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: esborrarTasca,
            ),
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  activeColor: Colors.teal[200],
                  checkColor: Colors.white,
                  side: BorderSide(color: Colors.white!),
                  value: false,
                  onChanged: canviarValocrCheckBox,
                ),
                //Text
                Text(
                  textTasca,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: valorCheckBox
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
