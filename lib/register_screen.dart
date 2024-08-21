import 'package:auth_firebase/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button-navigation/halaman_bottom.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController txtNama = TextEditingController(
    text: "",
  );
  final TextEditingController txtJurusan = TextEditingController(
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
    if (txtEmail.text.isEmpty ||
        txtPassword.text.isEmpty ||
        txtNama.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
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
                          "Buat Akun Baru",
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
                            labelText: "Nama",
                            hintText: "Tuliskan Nama Kamu",
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(
                              12,
                            ),
                          ),
                          controller: txtNama,
                          keyboardType: TextInputType.name,
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
                            labelText: "Jurusan",
                            hintText: "Tuliskan Jurusan Kamu",
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(
                              12,
                            ),
                          ),
                          controller: txtJurusan,
                          keyboardType: TextInputType.text,
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
                              12,
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
                              12,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HalamanBottom(),
                                  ),
                                );
                              } else if (state is AuthFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.error,
                                    ),
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
                                    120,
                                    45,
                                  ),
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.blue,
                                  animationDuration: const Duration(
                                    seconds: 3,
                                  ),
                                ),
                                onPressed: () {
                                  if (validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Isi Semua Field",
                                        ),
                                      ),
                                    );
                                  } else {
                                    context.read<AuthCubit>().signUp(
                                          email: txtEmail.text,
                                          password: txtPassword.text,
                                          name: txtNama.text,
                                          jurusan: txtJurusan.text,
                                        );
                                  }
                                },
                                child: const Text(
                                  "Register",
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
                      const Text("Sudah Punya Akun"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
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
      ),
    );
  }
}
