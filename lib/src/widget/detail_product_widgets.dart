part of 'widgets.dart';

class DetailProductWidget extends StatefulWidget {
  final DetailProductModel detailProducts;

  const DetailProductWidget({super.key, required this.detailProducts});

  @override
  State<DetailProductWidget> createState() => _DetailProductWidgetState();
}

class _DetailProductWidgetState extends State<DetailProductWidget> {
  List<Color> colors = [
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.black,
    Colors.red
  ];

  _sizedBox(double val) {
    return SizedBox(height: val);
  }

  AddProduct bloc = AddProduct();
  Widget _buildImageproduct(Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.network(
              widget.detailProducts.image!,
              fit: BoxFit.cover,
              height: size.height * 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModalWidget() {
    return Column(
      children: [
        const Text("data"),
        _sizedBox(10),
        ElevatedButton(
            onPressed: () {}, child: const Text("Masukkan Keranjang"))
      ],
    );
  }

  Widget _buildDetail(Size size) {
    return Container(
      height: size.height * 0.34,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              widget.detailProducts.title!,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial'),
            ),
          ),
          _sizedBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          _sizedBox(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              widget.detailProducts.description!,
              maxLines: 3,
              style: const TextStyle(fontSize: 12, fontFamily: 'Arial'),
            ),
          ),
          _sizedBox(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${widget.detailProducts.price!} US",
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddchart(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.25 - kToolbarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ChangeColorProductCubit, ChangeColorProductState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: colors.map((e) {
                        int index = colors.indexOf(e);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<ChangeColorProductCubit>(context)
                                  .changeColor(index);
                            },
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: e, shape: BoxShape.circle),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                              width: (index ==
                                      (state as ChangeColorProductIsColor)
                                          .index)
                                  ? 30
                                  : 20,
                              height: (index == (state.index) ? 30 : 20),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.result.add("minus");
                      },
                      icon: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.black26.withOpacity(0.3),
                      ),
                    ),
                    StreamBuilder(
                      stream: bloc.output,
                      initialData: 0,
                      builder: (context, snapshot) => Text("${snapshot.data}"),
                    ),
                    IconButton(
                      onPressed: () {
                        bloc.result.add("add");
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.black12.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              fixedSize: const Size(350, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: Colors.deepOrange),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (context) => _buildModalWidget());
            },
            child: const Text("Add to Chart"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageproduct(size),
        _sizedBox(20),
        _buildDetail(size),
        _sizedBox(10),
        _buildAddchart(size),
      ],
    );
  }
}
