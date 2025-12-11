part of '../widgets.dart';

class PasswordFiled extends StatefulWidget {
  final TextEditingController controller;
  const PasswordFiled({super.key, required this.controller});

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool showPassword = true;
  Icon icon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Enter your password',
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
              icon = showPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility);
            });
          },
          icon: icon,
        ),
      ),
      obscureText: showPassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class ConfirmPasswordFiled extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  const ConfirmPasswordFiled({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  @override
  State<ConfirmPasswordFiled> createState() => _ConfirmPasswordFiledState();
}

class _ConfirmPasswordFiledState extends State<ConfirmPasswordFiled> {
  bool showPassword = true;
  Icon icon = const Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: 'Confirm your password',
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
              icon = showPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility);
            });
          },
          icon: icon,
        ),
      ),
      obscureText: showPassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password again';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (value != widget.passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
