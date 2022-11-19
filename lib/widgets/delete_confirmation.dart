import 'package:flutter/material.dart';

class DeleteConfirmation extends StatelessWidget {
  final confirmDelete;
  const DeleteConfirmation({super.key, required this.confirmDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("DELETE TODO?"),
      content: const Text('Are you sure you want to delete this todo?'),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('NO'),
        ),
        ElevatedButton(
          onPressed: () {
            confirmDelete();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text('YES'),
        ),
      ],
    );
  }
}
