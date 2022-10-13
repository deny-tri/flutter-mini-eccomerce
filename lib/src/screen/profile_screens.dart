part of 'screens.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  _sizedBox(double val) {
    return SizedBox(
      height: val,
    );
  }

  _colorbuild() {
    return const TextStyle(color: Colors.white);
  }

  Widget _buildProfileTop(Size size) {
    return Container(
      width: size.width,
      height: size.height / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff1f005c),
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Profile",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(80),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(color: Colors.white, spreadRadius: 3)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    "assets/images/profil.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              _sizedBox(10),
              Text(
                "dheni.serenade@gmail.com",
                style: _colorbuild(),
              ),
              const Text(
                "Derry Reptic",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Edit",
                    style: _colorbuild(),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Camera",
                    style: _colorbuild(),
                  )
                ],
              ),
              Column(
                children: [
                  DialogWidgets(),
                  const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuMiddle(Size size) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const FaIcon(FontAwesomeIcons.wallet),
              ),
              const Text(
                "Belum Bayar",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const FaIcon(FontAwesomeIcons.truck),
              ),
              const Text(
                "Pengiriman",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const FaIcon(FontAwesomeIcons.coins),
              ),
              const Text(
                "Coins",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const FaIcon(FontAwesomeIcons.ticket),
              ),
              const Text(
                "Voucher",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const FaIcon(FontAwesomeIcons.star),
              ),
              const Text(
                "Beri Penilaian",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builMenuBottom(Size size) {
    return SizedBox(
      height: size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.payment),
                  const Text("PayLater"),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.payment),
                  const Text("Credit Card"),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.shopping_cart),
                  const Text("Archieve"),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const FaIcon(FontAwesomeIcons.clock),
                  const Text("History"),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const FaIcon(FontAwesomeIcons.thumbsUp),
                  const Text("Favorite Saya"),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const FaIcon(FontAwesomeIcons.question),
                  const Text("Pusat Bantuan"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: appGradient(),
        title: const Text("Profile"),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileTop(size),
                _sizedBox(10),
                _buildMenuMiddle(size),
                _sizedBox(10),
                _builMenuBottom(size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
