import 'package:flutter/material.dart';

class CustomQuantityButton extends StatelessWidget {
  const CustomQuantityButton(
      {Key? key, required this.icon, required this.onTap})
      : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white)),
        ),
      ),
    );
  }
}
