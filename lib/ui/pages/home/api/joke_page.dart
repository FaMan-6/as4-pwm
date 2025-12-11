part of '../home_pages.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Map<String, dynamic> quote = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchQuote();
  }

  void _fetchQuote() async {
    final response = await ApiService().fetchQuote();
    print('response: ${response}');
    setState(() {
      quote = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quote of the day',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SpacerHeight(height: 10),
            Text(
              '"${quote["quote"]}"',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SpacerHeight(height: 10),
            Text(
              '- ${quote["author"]}',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.refresh,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () => _fetchQuote(),
      ),
    );
  }
}
