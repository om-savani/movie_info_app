import 'package:flutter/material.dart';
import 'package:movie_info_app/main.dart';
import 'package:movie_info_app/model/imdb_model.dart';
import 'package:movie_info_app/screens/home/provider/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataProvider read = DataProvider();
  DataProvider watch = DataProvider();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<DataProvider>().loadData('titanic');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    read = context.read<DataProvider>();
    watch = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.grey.shade800),
              controller: searchController,
              onSubmitted: (value) {
                read.loadData(searchController.text);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade800),
                hintText: "Enter Movie Name",
                hintStyle: TextStyle(color: Colors.grey.shade800),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: watch.edge.length,
                itemBuilder: (context, index) {
                  Edges data = watch
                      .titleModel!.dataMainSearch!.mainModels!.edge![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail_page',
                          arguments: data.nodes!.entityModel!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                data.nodes?.entityModel!.imgModels!.imgUrl ??
                                    ''),
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
