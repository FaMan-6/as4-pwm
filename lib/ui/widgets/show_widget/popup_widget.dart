part of '../widgets.dart';

Future<bool?> showPopupWidget(
  BuildContext context,
  String message,
  String title,
  String? okText,
) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 23),
        children: [
          SpacerHeight(height: 10),
          Text(message),
          SpacerHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context, false),
              ),
              DefaultButton(
                text: okText ?? 'ok',
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
          SpacerHeight(height: 23),
        ],
      );
    },
  );
}
