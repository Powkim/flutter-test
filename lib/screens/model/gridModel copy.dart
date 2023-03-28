class GridModel2 {
  
  String? imageUrlMini;
  
  GridModel2(
      {
        
      this.imageUrlMini,
     });

  GridModel2.fromJson(Map<String, dynamic> json) {
   
    imageUrlMini = json['imageUrlMini'];
  }

}

