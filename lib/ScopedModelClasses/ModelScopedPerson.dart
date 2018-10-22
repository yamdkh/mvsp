import 'package:mvsp/Model/Person.dart';
import 'package:mvsp/Presenter/ContractPerson.dart';
import 'package:scoped_model/scoped_model.dart';

class ModelScopedPerson extends Model implements ContractFetchPerson {
  List<Person> _personsList;
  int counter = 0;

  List<Person> get personList => _personsList;

  PresenterPerson presenter;
  bool isLoading;

  ModelScopedPerson() {
    presenter = PresenterPerson(this);
    isLoading = true;
    presenter.load();
  }

  void notify() {
    this.notifyListeners();
  }

  @override
  void fetchPersonList(List<Person> persons) {
    _personsList = persons;
    isLoading = false;
    notify();
  }
}

