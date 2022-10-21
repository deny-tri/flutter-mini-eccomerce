part of 'widgets.dart';

class DialogWidgets extends StatelessWidget {
  const DialogWidgets({super.key});

  showAlertDialog(BuildContext context) {
    Widget okButton = BlocListener<CheckLoginCubit, CheckLoginState>(
      listener: (context, state) {
        if (state is CheckLoginIsLogOut) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Berhasil Log Out")));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreens()));
        }
      },
      child: TextButton(
        onPressed: () {
          BlocProvider.of<CheckLoginCubit>(context).logout();
        },
        child: const Text('Ya'),
      ),
    );
    Widget cancelButton = TextButton(
      onPressed: () => Navigator.pop(context, 'Tidak'),
      child: const Text('Tidak'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Notice"),
      content: const Text("Anda ingin keluar?"),
      actions: [
        okButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showAlertDialog(context);
      },
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
    );
  }
}
