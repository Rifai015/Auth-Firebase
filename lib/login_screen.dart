import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button-navigation/halaman_bottom.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txtNama = TextEditingController(
    text: "",
  );
  final TextEditingController txtEmail = TextEditingController(
    text: "",
  );
  final TextEditingController txtPassword = TextEditingController(
    text: "",
  );

  bool obscureText = true;

  bool validate() {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 12,
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login Your Account",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          labelText: "Email",
                          hintText: "nama@example.com",
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.all(
                            15,
                          ),
                        ),
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.yellow,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          hintStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.all(
                            15,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  obscureText = !obscureText;
                                },
                              );
                            },
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        controller: txtPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: obscureText,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSucces) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HalamanBottom(),
                                ),
                                (route) => false,
                              );
                            } else if (state is AuthFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.error,
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(
                                  double.maxFinite,
                                  45,
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.green,
                                animationDuration: const Duration(
                                  seconds: 3,
                                ),
                              ),
                              onPressed: () {
                                if (validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Tolong Isi Semua Field",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  context.read<AuthCubit>().signIn(
                                        email: txtEmail.text,
                                        password: txtPassword.text,
                                      );
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.blue,
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
    );
  }
}
