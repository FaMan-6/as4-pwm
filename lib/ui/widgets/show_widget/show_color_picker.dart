part of '../widgets.dart';

Future<String?> showColorPicker(BuildContext context) {
  return showDialog<String>(
    fullscreenDialog: false,
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Select a color'),
        contentPadding: const EdgeInsets.symmetric(horizontal: 23),
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            shrinkWrap: true,
            itemCount: ScheduleColorOptions.names.length,
            itemBuilder: (context, index) {
              final color = ScheduleColorOptions.names[index];
              final previewColor = ScheduleColorMapper.fromName(
                color,
                context,
              ).primaryContainer;
              return GestureDetector(
                onTap: () {
                  Modular.to.pop(color);
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: previewColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(50, 0, 0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SpacerHeight(height: 23),
        ],
      );
    },
  );
}
