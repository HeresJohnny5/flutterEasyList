import 'package:scoped_model/scoped_model.dart';

// LOCAL IMPORTS
import '../models/user.dart';

class UserModel extends Model {
  User _authenticatedUser;

  void login(String email, String password) {
    _authenticatedUser = User(id: 'hardcode1', email: email, password: password);
  }
}