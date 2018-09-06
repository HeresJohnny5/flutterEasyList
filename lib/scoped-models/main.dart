import 'package:scoped_model/scoped_model.dart';

// LOCAL IMPORTS
import './user.dart';
import './products.dart';

class MainModel extends Model with UserModel, ProductsModel{}