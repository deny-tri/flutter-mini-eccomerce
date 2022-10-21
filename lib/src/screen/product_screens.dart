part of 'screens.dart';

class ProductScreens extends StatefulWidget {
  const ProductScreens({super.key});

  @override
  State<ProductScreens> createState() => _ProductScreensState();
}

class _ProductScreensState extends State<ProductScreens> {
  bool _searchApp = false;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
    super.initState();
  }

  Widget _buildTextField() {
    return const TextField(
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.white54, fontSize: 20),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      // gradient: appGradient(),
      title: !_searchApp
          ? const Text(
              "Product",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            )
          : _buildTextField(),
      actions: !_searchApp
          ? [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _searchApp = true;
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ]
          : [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchApp = false;
                  });
                },
              ),
            ],
    );
  }

  Widget _buildGridView(Size size) {
    final double conHeight = (size.height / 2 - kToolbarHeight);
    final double conWidth = size.width / 2;
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductIsFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ProductIsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductIsSuccesess) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (conWidth / conHeight),
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children:
                state.data.map((e) => ProductWidget(products: e)).toList(),
          );
        }

        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
      },
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppbar(),
          body: _buildGridView(size),
        ),
      ),
    );
  }
}
