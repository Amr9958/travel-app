import 'package:flutter/material.dart';
import 'package:note_app__/misc/colors.dart';

class Dots extends StatelessWidget {
  int Pageindex;

  Dots({super.key, required this.Pageindex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            3,
            (index) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Container(
                  width: 8,
                  height: (Pageindex == index) ? 25 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                      color: (Pageindex == index)
                          ? AppColors.mainColor
                          : AppColors.mainColor.withOpacity(0.3)),
                )))
      ],
    );
  }
}
