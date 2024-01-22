import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  FilterButtonWidget({super.key, this.text = '' , this.color = Colors.white, this.onPressed});

  String text;
  Color color;
  VoidCallback? onPressed;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
             
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1.5),
                color: color,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
  }
}
