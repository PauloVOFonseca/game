import 'package:flutter/material.dart';

class Joypad extends StatelessWidget {
  const Joypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        children: const [
          DirectionJoypad(
            alignment: Alignment.topCenter,
            icon: Icons.arrow_upward_rounded,
          ),
          DirectionJoypad(
            alignment: Alignment.bottomCenter,
            icon: Icons.arrow_downward_rounded,
          ),
          DirectionJoypad(
            alignment: Alignment.centerRight,
            icon: Icons.arrow_forward_rounded,
          ),
          DirectionJoypad(
            alignment: Alignment.centerLeft,
            icon: Icons.arrow_back_rounded,
          ),
        ],
      ),
    );
  }
}

class DirectionJoypad extends StatelessWidget {
  final Alignment alignment;
  final IconData icon;
  const DirectionJoypad({Key? key, required this.alignment, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}
