class User {
  String email;
  String fullName;
  String phone;
  String image;
  String address;
  String description;
  String gender;
  String birthday;
  String highSchool;

  User({
    this.email,
    this.fullName,
    this.phone,
    this.image,
    this.address,
    this.description,
    this.gender,
    this.birthday,
    this.highSchool,
  });

  static List<User> createListConsulant() {
    List<User> list = [];
    for (int i = 0; i < 10; i++) {
      User newUser = User(
        email: 'consultant$i@gmail.com',
        fullName: 'consultant$i',
        phone: '096119123$i',
        image:
            'https://1.bp.blogspot.com/-GFEx6MCOc5U/YQnlwK9rt7I/AAAAAAAAv2Y/5atxGCDP3f04gnoEcPozTfn04478FFFlQCNcBGAsYHQ/s0/avatar-anime.jpg',
        address: '$i Lã Xuân Oai, Quận 9, TP HCM',
        description: 'Consultant$i is a handsome boy, I like fishing',
        gender: 'Male',
        birthday: '03/07/1998',
      );
      list.add(newUser);
    }
    return list;
  }
}
