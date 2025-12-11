part of 'home_pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List<String> pages = ['/home', '/jk', '/profile'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Modular.to.navigate('/main${pages[currentIndex]}');
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    Modular.to.navigate('/main${pages[index]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: currentIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // NavigationDestination(
          //   icon: currentIndex == 1
          //       ? Icon(Icons.calendar_month)
          //       : Icon(Icons.calendar_month_outlined),
          //   label: 'Schedules',
          // ),
          NavigationDestination(
            icon: currentIndex == 1
                ? Icon(Icons.chat_bubble_outlined)
                : Icon(Icons.chat_bubble_outline),
            label: 'Quote',
          ),
          NavigationDestination(
            icon: currentIndex == 2
                ? Icon(Icons.person)
                : Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: _onItemTapped,
        selectedIndex: currentIndex,
      ),
    );
  }
}
