part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String caption;
  final bool isLoading;
  final double? width;
  final Function()? onPressed;

  const ButtonWidget(
      {super.key,
      required this.caption,
      this.isLoading = false,
      this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          fixedSize: const Size(350, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Colors.blueAccent),
          ),
        ),
        onPressed: (isLoading) ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: (isLoading)
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                )
              : Text(
                  caption,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
