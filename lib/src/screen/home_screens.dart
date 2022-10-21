part of 'screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  NotificationService notificationService = NotificationService();

  void showNotif() {
    notificationService.showNotifBirthday('Ada Promo nich buat kamu',
        'Mens Casual Slim Fit yang kamu inginkan turun harga 70%', '3');
  }

  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context).add(FetchCategoryProduct());
    notificationService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3),
        onDidReceiveNotificationResponse);
    super.initState();
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<dynamic> onReceiveNotif(int id, String? title, String? body) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kamu Mendapatkan $body')));
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearch(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                Positioned(
                  right: 0,
                  top: -5,
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white),
                    ),
                    child: const Center(
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 10,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              notificationService.showNotifBirthday(
                  'Promo Bulan Oktober', 'Promo guys', '3');
            },
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
                  child: const Icon(Icons.notifications_none),
                ),
                Positioned(
                  right: 0,
                  top: -5,
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white),
                    ),
                    child: const Center(
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 10,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProduct(Size size) {
    return Container(
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
          "https://cf.shopee.co.id/file/6d08dd868ce7527e3a5ac6598116630e",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildIconbutton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductScreens()));
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.orange,
                  ),
                ),
                const Text("Product"),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    final cubit = context.read<DarkThemeCubit>();
                    cubit.darkTheme();
                  },
                  icon: const Icon(
                    Icons.dark_mode,
                    color: Colors.tealAccent,
                  ),
                ),
                const Text("Theme Color"),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreens()));
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
                const Text("Profile"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdown() {
    return const SlideCountdownSeparated(
      duration: Duration(days: 31),
    );
  }

  Widget _buildCategory(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Promo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        _sizedBox(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Cash Back"),
            _buildCountdown(),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductScreens()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Views"),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: BlocConsumer<CategoryProductBloc, CategoryProductState>(
                  listener: (context, state) {
                    if (state is CategoryProductIsFailed) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    if (state is CategoryProductIsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CategoryProductIsSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) =>
                            CategoryWidget(categories: state.data[index]),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _sizedBox(double val) {
    return SizedBox(height: val);
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearch(size),
                  _sizedBox(10),
                  _buildProduct(size),
                  _sizedBox(12),
                  _buildIconbutton(),
                  _sizedBox(10),
                  _buildCategory(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
