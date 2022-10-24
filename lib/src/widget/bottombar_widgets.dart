part of 'widgets.dart';

class BottombarWidget extends StatelessWidget {
  const BottombarWidget({super.key});
  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreens();
      case 1:
        return const ProductScreens();
      case 2:
        return const ProfileScreens();

      default:
        return const Text('Not Found');
    }
  }

  void _getChangeBottombar(int index, BuildContext context) {
    switch (index) {
      case 0:
        BlocProvider.of<ChangeBottomnavbarCubit>(context).changeHome();
        break;
      case 1:
        BlocProvider.of<ChangeBottomnavbarCubit>(context).changeProduct();
        break;
      case 2:
        BlocProvider.of<ChangeBottomnavbarCubit>(context).changeProfile();
        break;
      default:
    }
  }

  Widget _buildBottomNav(BuildContext context) {
    return CurvedNavigationBar(
      height: 60.0,

      // ignore: prefer_const_literals_to_create_immutables
      items: <Widget>[
        const Icon(Icons.home, size: 30, color: Colors.white),
        const Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white),
        const Icon(Icons.person, size: 30, color: Colors.white),
      ],
      color: Colors.blueAccent,
      buttonBackgroundColor: Colors.blueAccent,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        _getChangeBottombar(index, context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBottomnavbarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(context),
        );
      },
    );
  }
}
