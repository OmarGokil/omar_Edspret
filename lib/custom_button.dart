import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String buttomTitle;
  final String iconPahth;
  final Color buttomColor;
  final Color textColor;
  final void Function()? onPressed;
  const CustomButtom({
    super.key,
    required this.buttomColor,
    required this.buttomTitle,
    required this.iconPahth,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttomColor),
      ),
      child: SizedBox(
        width: 175,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPahth),
            const SizedBox(
              width: 8,
            ),
            Text(buttomTitle),
          ],
        ),
      ),
    );
  }
}
