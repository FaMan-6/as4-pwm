part of 'auth_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final authController = AuthTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is AuthError) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            });
          }

          if (state is AuthSuccess) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              Modular.to.navigate('/main/');
            });
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Calendar-rafiki.svg',
                      height: 250,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context).textTheme.headlineLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Please Sign in to continue',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    EmailField(controller: authController.emailController),
                    SizedBox(height: 15),
                    PasswordFiled(
                      controller: authController.passwordController,
                    ),
                    SizedBox(height: 20),
                    DefaultButton(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final email = authController.emailController.text;
                          final password =
                              authController.passwordController.text;
                          ReadContext(
                            context,
                          ).read<AuthCubit>().signIn(password, email);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () =>
                              Modular.to.pushReplacementNamed('/auth/signup'),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
