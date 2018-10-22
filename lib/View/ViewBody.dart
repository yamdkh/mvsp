import 'package:flutter/material.dart';
import 'package:mvsp/Model/Person.dart';
import 'package:mvsp/ScopedModelClasses/ModelScopedPerson.dart';

import 'package:scoped_model/scoped_model.dart';

class ViewBody extends StatefulWidget {
  ViewBody();

  @override
  ViewBodyState createState() => ViewBodyState();
}

class ViewBodyState extends State<ViewBody> {
  bool _show = false;
  ModelScopedPerson scopedPerson;

  @override
  void initState() {
    scopedPerson =
        ModelScopedPerson(); // will run Presenter to fetch and load data immediately.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Scoped Model of this  widget start here.
    return ScopedModel<ModelScopedPerson>(
      model: scopedPerson,
      child: ScopedModelDescendant<ModelScopedPerson>(
        builder: (BuildContext context, Widget child, model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                model.counter.toString(),
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
              model.isLoading
                  ? CircularProgressIndicator()
                  : _show
                      ? list([]) // [] to make empty box
                      : list(model.personList),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        model.counter++;
                        _show = !_show;
                        model.notify();
                      },
                      child: Text(
                        'Show/Hide',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget list(List<Person> x) {
    return Expanded(
      child: ListView(
          children: x
              .map((f) => ListTile(
                    title: Text(f.name),
                    trailing: Text(f.nat.toString()),
                    subtitle: Text('age: ${f.age}'),
                  ))
              .toList()),
    );
  }
}
