part of '../widgets.dart';

void showBottomSchedule(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpacerHeight(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Modular.to.pushNamed(
                  '/main/add_schedule',
                  forRoot: true,
                  arguments: {'CATEGORY': null},
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Text('Add Schedule'),
              ),
            ),
            SpacerHeight(height: 5),
            Devider(height: 1),
            SpacerHeight(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Modular.to.pushNamed('/main/add_category', forRoot: true);
              },
              child: SizedBox(
                width: double.infinity,
                child: Text('Add Category'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
