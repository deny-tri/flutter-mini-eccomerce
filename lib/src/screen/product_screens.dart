part of 'screens.dart';

class ProductScreens extends StatelessWidget {
  const ProductScreens({super.key});

  Widget _buildSearch(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          Container(
            width: size.width * 0.7,
            // height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              // onChanged: (value) {

              // },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.filter_alt_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
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
    BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSearch(context),
                Center(child: _buildGridView(size)),
              ],
            ),
          ),
          // body: _buildGridView(size),
        ),
      ),
    );
  }
}
