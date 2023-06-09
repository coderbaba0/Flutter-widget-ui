import 'package:flutter/material.dart';

class OnBoardItem extends StatelessWidget {
  const OnBoardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
