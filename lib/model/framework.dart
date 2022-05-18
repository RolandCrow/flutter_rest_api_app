class FrameWork {
  String name;
  String language;
  String objectId;

  FrameWork({
    this.name,
    this.language,
});

  FrameWork.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'];
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() => {
    'name' : name,
    'language' : language,
    'objectId' : objectId,
  };





  
}