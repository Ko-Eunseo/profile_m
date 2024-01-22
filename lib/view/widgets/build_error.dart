import 'package:flutter/material.dart';

Widget buildError(error, void Function()? onPressed) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: onPressed,
            child: const Text(
              'retry',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    ),
  );
}
