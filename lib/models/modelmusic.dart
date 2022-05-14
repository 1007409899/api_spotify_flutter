class ModelSpotifyPlaylistTrack {
  String id = '';
  String? name = '';
  String? preview_url = '';
  String images = '';
  String nameAlbum = "";
  int duration_ms = 0;

  ModelSpotifyPlaylistTrack(
      id, name, preview_url, images, nameAlbum, duration_ms) {
    this.id = id;
    this.name = name;
    this.preview_url = preview_url;
    this.images = images;
    this.nameAlbum = nameAlbum;
    this.duration_ms = duration_ms;
  }
}
