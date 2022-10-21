part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // BlocProvider.of<CheckLoginCubit>(context).checkLogin();
    return BlocProvider(
      create: (context) => CheckLoginCubit()..checkLogin(),
      child: BlocConsumer<CheckLoginCubit, CheckLoginState>(
        listener: (context, state) {
          if (state is CheckLoginIsSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreens()));
          } else if (state is CheckLoginIsFailed) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreens()));
          }
        },
        builder: (context, state) {
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
        },
      ),
    );
  }
}
