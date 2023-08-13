class WallPaperModel{
   SrcModel ?src;
  WallPaperModel({ this.src});
  factory WallPaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallPaperModel(
      src: jsonData['src'],

    );
  }
}
class SrcModel {
   String ?original;
   String ?small;
   String ?potrait;
   String ?medium;
  SrcModel({ this.original, this.small, this.potrait,this.medium});
  factory SrcModel.fromMap(Map<String,dynamic> jsonData){
    return SrcModel(
      original: jsonData['original'],
      small: jsonData['small'],
        potrait: jsonData['potrait'],
      medium: jsonData['medium'],

    );
  }
}