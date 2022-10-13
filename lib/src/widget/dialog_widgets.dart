part of 'widgets.dart';

class DialogWidgets extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  DialogWidgets({super.key});
  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () async {
        SharedPreferences storage = await _prefs;
        if (storage.getBool('Login') == true) {
          storage.clear().then(
                (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreens())),
              );
        }
      },
      child: const Text('Ya'),
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
