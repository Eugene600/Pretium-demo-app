import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/auth/widgets/custom_progress_indicator.dart';
import 'package:pretium/auth/widgets/rotating_icon.dart';
import 'package:pretium/navigation/route_names.dart';
import 'package:pretium/utils/responsive_form_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _hidePassword = true;
  bool _termsAgreed = false;

  void _togglePassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveWidgetFormLayout(
              buildPageContent:
                  (BuildContext context, Color? color) => SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary.withValues(
                                    alpha: 0.8,
                                  ),
                                  theme.colorScheme.primary.withValues(
                                    alpha: 0.4,
                                  ),
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
                              Icons.business_center,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Create Account",
                            style: theme.textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Simplify your crypto payments with us",
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
                                  FormBuilderTextField(
                                    name: 'first_name',
                                    decoration: const InputDecoration(
                                      hintText: "First Name",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.person_outline),
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText:
                                            'Please enter your first name',
                                      ),
                                      FormBuilderValidators.minLength(
                                        2,
                                        errorText:
                                            'last name must be at least two characters',
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(height: 10),
                                  FormBuilderTextField(
                                    name: 'last_name',
                                    decoration: const InputDecoration(
                                      hintText: "Last Name",
                                      prefixIcon: Icon(Icons.person_outline),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText:
                                            'Please enter your last name',
                                      ),
                                      FormBuilderValidators.minLength(
                                        2,
                                        errorText:
                                            'last name must be at least two characters',
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(height: 10),
                                  FormBuilderTextField(
                                    name: 'email',
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: "Email",
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
                                  FormBuilderTextField(
                                    name: 'password',
                                    obscureText: _hidePassword,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      prefixIcon: const Icon(
                                        Icons.lock_outlined,
                                      ),
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
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: _termsAgreed,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _termsAgreed = newValue ?? false;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Opening Terms and Conditions...',
                                      ),
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                    ),
                                  );
                                  _launchUrl(
                                    'https://pretium.africa/term-of-use',
                                  );
                                },
                                child: Text(
                                  'Accept Terms and Conditions',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                if (!_termsAgreed) {
                                  WidgetsBinding.instance.addPostFrameCallback((
                                    _,
                                  ) {
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 4),
                                      behavior: SnackBarBehavior.floating,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RotatingIcon(),
                                              Text(
                                                'You must accept the Terms & Conditions',
                                                style: theme
                                                    .textTheme
                                                    .labelMedium
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).hideCurrentSnackBar();
                                                },
                                                child: Text(
                                                  'Retry'.toUpperCase(),
                                                  style: theme
                                                      .textTheme
                                                      .labelMedium
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          const SizedBox(
                                            width: double.infinity,
                                            height: 4,
                                            child: CustomProgressIndicator(
                                              duration: Duration(seconds: 4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(snackBar);
                                  });

                                  return;
                                }

                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  debugPrint('Proceed to create Account!!!');
                                } else {
                                  debugPrint('Form is not valid');
                                }
                              },
                              child: const Text("Create Account"),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: theme.textTheme.bodyMedium,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.goNamed(RouteNames.loginScreen);
                                },
                                child: Text(
                                  "Login",
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
          ],
        ),
      ),
    );
  }
}
