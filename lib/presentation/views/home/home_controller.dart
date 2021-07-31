import 'package:consumo_api_cnpj/domain/entities/empresa.dart';
import 'package:consumo_api_cnpj/infrastrucure/repository/empresa_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final EmpresaRepository repository = EmpresaRepository();

  @observable
  Empresa empresa = Empresa();

  @observable
  bool isLoading = false;

  @action
  buscarEmpresaCnpj(String buscaCnpj) {
    this.isLoading = true;

    try {
      repository.getCnpjData(buscaCnpj).then((value) {
        this.empresa = value;
      });
    } catch (e) {} finally {
      this.isLoading = false;
    }
  }
}