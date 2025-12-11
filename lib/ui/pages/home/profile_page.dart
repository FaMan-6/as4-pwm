part of 'home_pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is AuthLogout) {
          WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((
            timeStamp,
          ) {
            Modular.to.navigate('/auth');
          });
        }
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: () async {
                  final checker = await showPopupWidget(
                    context,
                    'Are you sure you want to logout?',
                    'Logout',
                    'Logout',
                  );
                  if (checker!) {
                    ReadContext(context).read<AuthCubit>().logout();
                  }
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(
                    avatar: user.supabase.userMetadata!['avatar_url'] ?? null,
                    username: user.supabase.userMetadata!['username'],
                  ),
                  Text(
                    user.supabase.userMetadata!['username'] ?? 'User',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SpacerHeight(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark mode',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

                      ValueListenableBuilder(
                        valueListenable: themeController.themeModeNotifier,
                        builder: (context, value, child) {
                          return Switch(
                            value: value == ThemeMode.dark,
                            onChanged: (value) {
                              themeController.toggleDarkMode(value);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
