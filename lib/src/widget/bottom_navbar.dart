part of 'widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int bottomNavBarIndex = 0;
  Color selectedColor = Colors.blue;
  Color customColors = Colors.white;
  _buildSwitchOnTap(int pos) {
    switch (pos) {
      case 0:
        return const HomeScreens();
      case 1:
        return const ProductScreens();
      case 2:
        return const ProductScreens();
      default:
        return const ProfileScreens();
    }
  }

  void _onTapBottom(value) {
    setState(() {
      bottomNavBarIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        selectedItemColor: selectedColor,
        backgroundColor: Colors.blueAccent,
        onTap: (value) {
          _onTapBottom(value);
          //
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
            backgroundColor: customColors,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.star_border,
              color: Colors.blue,
            ),
            label: 'Recommended',
            backgroundColor: customColors,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.list,
              color: Colors.blue,
            ),
            label: 'Category',
            backgroundColor: customColors,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            label: 'Chart',
            backgroundColor: customColors,
          ),
        ],
      ),
      body: _buildSwitchOnTap(bottomNavBarIndex),
    );
  }
}
