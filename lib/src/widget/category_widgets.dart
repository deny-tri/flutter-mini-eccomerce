part of 'widgets.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categories;

  const CategoryWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(1, 1)),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              categories.image!,
              //fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
