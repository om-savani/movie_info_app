import 'package:flutter/material.dart';
import 'package:movie_info_app/model/imdb_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Enitity? movie =
        ModalRoute.of(context)?.settings.arguments as Enitity?;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie?.titleTextModel?.text ?? 'Movie Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: movie?.imgModels?.imgUrl != null
                  ? Image.network(
                      movie!.imgModels!.imgUrl!,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : const Placeholder(
                      fallbackHeight: 200,
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              'Title: ${movie?.titleTextModel?.text ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Release Date: ${movie?.releaseDay?.date ?? '-'}-${movie?.releaseDay?.month ?? '-'}-${movie?.releaseDay?.year ?? '-'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Type: ${movie?.typeName ?? 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
