part of '../screens.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens>
    with WidgetsBindingObserver {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hidePass = true;
  bool isLoginProcessing = false;
  _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Processing Data"),
      ),
    );
  }

  void _hiddenPass() {
    setState(() {
      _hidePass = !_hidePass;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  //sized box
  Widget _sizedBox(double val) {
    return SizedBox(height: val);
  }

  // TextFormField
  Widget _buildTextformfield(String hint, TextEditingController newController,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        validator: isPassword
            ? ((value) {
                if (value == null || value.isEmpty) {
                  return 'Please input password';
                }
                return null;
              })
            : (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input email';
                }
                return null;
              },
        controller: newController,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isPassword ? (_hidePass) : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          icon: isPassword
              ? const Icon(
                  Icons.lock_open,
                  color: Colors.white70,
                )
              : const Icon(
                  Icons.people,
                  color: Colors.white70,
                ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    _hiddenPass();
                  },
                  icon: Icon(
                    _hidePass ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildHeaderTextLogin(Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SafeArea(
            child: Text(
              'Hello Again!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white70,
              ),
            ),
          ),
          _sizedBox(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Welcome back you’ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFieldLogin(Size size) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _buildTextformfield('Email', emailController),
            _buildTextformfield('Password', passController, isPassword: true),
            _sizedBox(10),
            const Text(
              "Forget Password ?",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

//Button Login
  Widget _buildButtonLogin() {
    return SizedBox(
      child: Column(
        children: [
          ButtonWidget(
            isLoading: isLoginProcessing,
            caption: "Login",
            onPressed: () async {
              final SharedPreferences storage = await _pref;
              setState(() {
                isLoginProcessing = true;
              });
              Future.delayed(
                const Duration(milliseconds: 3000),
                () {
                  if (_formKey.currentState!.validate()) {
                    if (emailController.text == "derry" &&
                        passController.text == "jacksi") {
                      storage.setBool("Login", true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreens()));
                      setState(() {});
                      isLoginProcessing = false;
                    } else {
                      setState(() {
                        isLoginProcessing = false;
                      });
                      _showSnackbar();
                    }
                  } else {
                    setState(() {
                      isLoginProcessing = false;
                    });
                  }
                },
              );
            },
          ),
          _sizedBox(15),
          const Text(
            "Or Continue With",
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }

  Widget _buildIconLogin(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/google.png",
            fit: BoxFit.cover,
            height: 20,
            width: 20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/apple-logo.png",
            fit: BoxFit.cover,
            height: 20,
            width: 20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {},
          child: Image.asset(
            "assets/images/facebook.png",
            fit: BoxFit.cover,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildTextRegis() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not a member ?",
          style: TextStyle(color: Colors.white54),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {},
          child: const Text(
            'Register now',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: background(),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeaderTextLogin(size),
                    _sizedBox(44),
                    _buildTextFieldLogin(size),
                    _sizedBox(44),
                    _buildButtonLogin(),
                    _sizedBox(20),
                    _buildIconLogin(size),
                    _sizedBox(20),
                    _buildTextRegis(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
