class User {
  String email;
  String password;

  User({required this.email, required this.password});

  // Method untuk melakukan validasi email
  bool isValidEmail() {
    // Sederhana: hanya memeriksa apakah ada '@' dan '.'
    return email.contains('@') && email.contains('.');
  }

  // Method untuk melakukan validasi password
  bool isValidPassword() {
    // Contoh: minimal 6 karakter
    return password.length >= 6;
  }
}
