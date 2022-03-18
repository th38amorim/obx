import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obx_com_br_app/domain/model/i_address_repository.dart';
import 'package:obx_com_br_app/infrastructure/sign_up/address_repository.dart';


List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<IAddressRepository>(create: (context) => AddressRepository()),
  ];
}
