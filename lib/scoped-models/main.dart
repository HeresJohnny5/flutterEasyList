import 'package:scoped_model/scoped_model.dart';

// LOCAL IMPORTS
import './connected_products.dart';

class MainModel extends Model with UserModel, ProductsModel, ConnectedProductsModel {}