import 'package:flutter/material.dart';
import 'package:github_app/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:github_app/models/github_repo.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Github Viewer"),
        ),
        body: Consumer<HomeViewModel>(builder: (context, model, child){
          return Center(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Flutter',
                      labelText: 'Query',
                    ),
                    maxLines: 1,
                    onChanged: (value){
                      model.setQuery(value);
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: new RaisedButton(
                      child: const Text('Search'),
                      onPressed: (){model.search();},
                    ),
                  ),

                  Column(
                    children: _createWidgets(model.getRepo())
                  )

                ]
            )
          );
        })
      )
    );
  }
}

Iterable<Widget> _createWidgets(List<GithubRepo> items) {

  var ret = new List<Widget>();
  if (items == null) {
    return ret;
  }
  items.forEach((item) {
    ret.add(
        Row(
          children: <Widget>[
            SizedBox(
              width: 60,
              child: Image.network(item.avatarUrl, fit: BoxFit.contain),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.name}'),
                  Text('★ ${item.starCount}')],
              )
            )



          ]
        )
        );
  });
  return ret;

}