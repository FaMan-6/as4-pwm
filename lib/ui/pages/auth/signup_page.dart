part of 'auth_pages.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final authController = AuthTextController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is AuthError) {
              print('Error Sign Up: ${state.message}');
              WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((
                _,
              ) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Sign Up Error')));
              });
            }

            if (state is AuthSuccess) {
              WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((
                _,
              ) {
                Modular.to.navigate('/main/');
              });
            }

            return SingleChildScrollView(
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
                            SpacerHeight(height: 15),
                            Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SpacerHeight(height: 5),
                            Text(
                              'Create an account to continue',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SpacerHeight(height: 15),
                    EmailField(controller: authController.emailController),
                    SpacerHeight(height: 15),
                    DefaultTextFiled(
                      hint: 'Enteru your username',
                      label: 'Username',
                      controller: authController.usernameController,
                    ),
                    SpacerHeight(height: 15),
                    PasswordFiled(
                      controller: authController.passwordController,
                    ),
                    SpacerHeight(height: 15),
                    ConfirmPasswordFiled(
                      controller: authController.confirmPasswordController,
                      passwordController: authController.passwordController,
                    ),
                    SpacerHeight(height: 20),
                    DefaultButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ReadContext(context).read<AuthCubit>().signUp(
                            authController.confirmPasswordController.text,
                            authController.passwordController.text,
                            authController.emailController.text,
                            authController.usernameController.text,
                          );
                        }
                      },
                    ),
                    SpacerHeight(height: 20),
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        SpacerWidth(width: 5),
                        GestureDetector(
                          onTap: () =>
                              Modular.to.pushReplacementNamed('/auth/'),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
