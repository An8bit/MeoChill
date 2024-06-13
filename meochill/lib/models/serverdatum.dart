class ServerDatum {
    String? name;
    String? slug;
    String? filename;
    String? linkembed;
    String? linkm3u8;

    ServerDatum({this.name, this.slug, this.filename, this.linkembed, this.linkm3u8}); 

    ServerDatum.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        slug = json['slug'];
        filename = json['filename'];
        linkembed = json['link_embed'];
        linkm3u8 = json['link_m3u8'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['name'] = name;
        data['slug'] = slug;
        data['filename'] = filename;
        data['link_embed'] = linkembed;
        data['link_m3u8'] = linkm3u8;
        return data;
    }
}