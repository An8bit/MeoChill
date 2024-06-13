import 'package:meochill/models/serverdatum.dart';

class Episode {
    String? servername;
    List<ServerDatum?>? serverdata;

    Episode({this.servername, this.serverdata}); 

    Episode.fromJson(Map<String, dynamic> json) {
        servername = json['server_name'];
        if (json['server_data'] != null) {
         serverdata = <ServerDatum>[];
         json['server_data'].forEach((v) {
         serverdata!.add(ServerDatum.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['server_name'] = servername;
        data['server_data'] =serverdata != null ? serverdata!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}