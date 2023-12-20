class User {
   String name;
   String email;
   String phoneNumber;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  String toString() => 'User(name: $name, email: $email, phone: $phoneNumber)';
}
