import 'dart:collection';
import 'dart:convert';

import 'package:api_spotify_flutter/models/modelmusic.dart';
import 'package:api_spotify_flutter/models/viewmodel.dart';
import 'package:api_spotify_flutter/pages/detailplaylist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../components/custom_list_playlist.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ModelSpotifyPlaylistTrack>> _futurePlaylistTracks;

  Future<List<ModelSpotifyPlaylistTrack>> _futurePlaylistTracksApi() async {
    final response = await http.get(
        Uri.parse(
            "https://spotify23.p.rapidapi.com/playlist_tracks/?id=37i9dQZF1DX4Wsb4d7NKfP&ids=2w9zwq3AktTeYYMuhMjju8&limit=10"),
        headers: {
          'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
          'X-RapidAPI-Key': '7188aac179msh890e4212cfc81c6p1e5395jsn43a076ba92f5'
        });

    List<ModelSpotifyPlaylistTrack> list = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonResponse = json.decode(body);
      //print(jsonResponse["items"][0]["track"]["id"]);
      for (var item in jsonResponse['items']) {
        list.add(ModelSpotifyPlaylistTrack(
          item["track"]["id"],
          item["track"]["name"],
          item["track"]["preview_url"],
          item["track"]["album"]["images"][0]["url"],
          item["track"]["album"]["name"],
          item["track"]["duration_ms"],
        ));
      }
    } else {
      throw Exception("Failed to load data");
    }
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futurePlaylistTracks = _futurePlaylistTracksApi();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ViewModeApiInfo = Provider.of<ViewModelApi>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Lista de Canciones",
            style: TextStyle(color: Color.fromARGB(255, 92, 91, 91)),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: Center(
          child: Container(
              child: FutureBuilder(
                  future: _futurePlaylistTracks,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return ListView(
                        children: _listPlaylist(snapshot.data, context),
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text("error");
                    }
                    return Center(child: CircularProgressIndicator());
                  })),
        ),
      ),
    );
  }

  List<Widget> _listPlaylist(data, context) {
    final ViewModeApiInfo = Provider.of<ViewModelApi>(context);

    List<Widget> list = [];
    for (var item in data) {
      list.add(
        CustomListTiitle(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Second()),
            ),
            ViewModeApiInfo.setId = item.id,
            ViewModeApiInfo.setName = item.name,
            ViewModeApiInfo.SetNameAlbum = item.nameAlbum,
            ViewModeApiInfo.SetImages = item.images,
            ViewModeApiInfo.SetPreview_url = item.preview_url,
            ViewModeApiInfo.SetDuration_ms = item.duration_ms,
          },
          id: item.id,
          name: item.name,
          preview_url: item.preview_url,
          images: item.images,
          nameAlbum: item.nameAlbum,
        ),
      );
    }
    return list;
  }
}
