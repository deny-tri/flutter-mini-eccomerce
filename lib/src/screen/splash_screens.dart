// ignore_for_file: use_build_context_synchronously

part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      checkLogin();
    });
    super.initState();
  }

  Future<void> checkLogin() async {
    final SharedPreferences storage = await _prefs;
    if (storage.getBool('Login') == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreens()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreens()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 2,
              height: size.height / 2,
              child: Image.asset(
                "assets/images/logo.jfif",
                height: size.height * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
