import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/navigation/route_names.dart';
import 'package:pretium/utils/responsive_form_widget_layout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  bool _rememberMe = false;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: ResponsiveWidgetFormLayout(
        buildPageContent:
            (BuildContext context, Color? color) => SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary.withValues(alpha: 0.8),
                              theme.colorScheme.primary.withValues(alpha: 0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text(
                        "Welcome Back!",
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sign in to continue",
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      FormBuilder(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'email',
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter your email',
                                  ),
                                  FormBuilderValidators.email(
                                    errorText:
                                        'Please enter a valid email address',
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              FormBuilderTextField(
                                name: 'password',
                                obscureText: _hidePassword,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: _togglePassword,
                                    icon: Icon(
                                      _hidePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter your password',
                                  ),
                                  FormBuilderValidators.minLength(
                                    4,
                                    errorText:
                                        'Password must be at least 4 characters',
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _rememberMe = newValue ?? false;
                              });
                            },
                          ),
                          Text('Remember Me'),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              context.goNamed(RouteNames.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              debugPrint('Proceed to login!!!');
                            } else {
                              debugPrint('Form is not valid');
                            }
                          },
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: theme.textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed(RouteNames.registrationScreen);
                            },
                            child: Text(
                              "Sign Up",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
