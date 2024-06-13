class Country {
    String? id;
    String? name;
    String? slug;

    Country({this.id, this.name, this.slug}); 

    Country.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        data['slug'] = slug;
        return data;
    }
}
