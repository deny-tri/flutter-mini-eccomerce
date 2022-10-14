part of 'screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  NotificationService notificationService = NotificationService();

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
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showNotif() {
    notificationService.showNotif("test aja");
  }

  @override
  void initState() {
    notificationService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3));
    super.initState();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      ),
    );
  }

  _sizedBox(double val) {
    return SizedBox(height: val);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearch(size),
              _sizedBox(10),
              _buildProduct(size),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductScreens()));
                  },
                  child: const Text("Product"),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreens()));
                  },
                  child: const Text("Profile"),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: showNotif,
                  child: const Text("Notification"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
