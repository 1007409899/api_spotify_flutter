import 'package:flutter/material.dart';

Widget CustomListTiitle({
  String? id,
  String? name,
  String? preview_url,
  String images = "",
  String? nameAlbum,
  onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(left: 15, right: 12, top: 8, bottom: 8),
      child: Row(children: [
        Container(
            width: 80,
            height: 80,
            child: Expanded(
              child: Hero(
                tag: id!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.green,
                    image: DecorationImage(
                      image: NetworkImage(images),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
        SizedBox(
          width: 10.0,
        ),
        Column(children: [
          Text(
            nameAlbum!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            name!,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ])
      ]),
    ),
  );
}
