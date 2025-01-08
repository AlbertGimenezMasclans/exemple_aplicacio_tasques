import 'package:flutter/material.dart';

class ItemTasca extends StatelessWidget {
  final String textTasca;
  final bool valorCheckBox;
  const ItemTasca({
    super.key,
    required this.textTasca,
    required this.valorCheckBox,
  });

  void funcioPelCheckbox(bool valor) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                onChanged: (valorrebut) {},
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
    );
  }
}
