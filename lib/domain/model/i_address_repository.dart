import 'package:obenx_com_br_app/domain/model/user.dart';

abstract class IAddressRepository {
  Future<User?> getCepData(String cep);
}
