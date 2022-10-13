part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  final int productId;

  const DetailProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: FutureBuilder<http.Response>(
          future: http
              .get(Uri.parse("https://fakestoreapi.com/products/$productId")),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final detailProducts =
                  detailProductModelFromJson(snapshot.data!.body);
              return DetailProductWidget(detailProducts: detailProducts);
            }
            if (snapshot.hasError) {}
            return const SizedBox();
          }),
    );
  }
}
