class CompModel{
  final String uId;
  final String Hostel;
  final String Room;
  final String Bed;
  final String Category;
  final String Description;

  CompModel({
    required this.uId,
    required this.Hostel,
    required this.Room,
    required this.Bed,
    required this.Category,
    required this.Description,
  });

  Map<String, dynamic> toMap(){
    return{
      'uId' :uId,
      'Hostel' : Hostel,
      'Room' : Room,
      'Bed' : Bed,
      'Category' : Category,
      'Description' : Description,
    };
  }
  factory CompModel.fromMap(Map<String, dynamic> json) {
    return CompModel(
      uId : json['uId'],
      Hostel : json['Hostel'],
      Room : json['Room'],
      Bed : json['Bed'],
      Category : json['Category'],
      Description : json['Description'],
    );
  }
}


