import 'package:flutter/material.dart';
import 'package:movie_info_app/main.dart';
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

  @override
  void initState() {
    context.read<DataProvider>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    read = context.read<DataProvider>();
    watch = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SearchBar(
            leading: const Icon(Icons.search),
            hintText: "Movie Name",
            onSubmitted: (value) {
              read.changeName(value);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: watch.title.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: watch.title.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(watch.titleModel!.title!),
                          fit: BoxFit.cover),
                    ),
                    child: Text(watch.titleModel!.title ?? 'no title'),
                  );
                },
              ),
      ),
    );
  }
}
