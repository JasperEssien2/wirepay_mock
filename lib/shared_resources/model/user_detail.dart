import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  const UserDetail({required this.name, required this.email});

  final String name;
  final String email;

  @override
  List<Object> get props => [name, email];

  @override

  bool? get stringify => true;
}
