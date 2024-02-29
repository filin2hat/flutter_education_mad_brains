import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.title, required this.onPressed});

  final String title; // to be implemented later
  final void Function() onPressed; // to be implemented later

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 3,
            spreadRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.onBackground,
          ],
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: Theme.of(context).colorScheme.primary,
          highlightColor: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
