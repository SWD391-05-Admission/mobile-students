import '../models/major.dart';
import '../models/university.dart';

import '../models/counselor.dart';

class Talkshow {
  int ID;
  String image;
  String timeStart;
  String timeFinish;
  String date;
  int price;
  Counselor counselor;
  String description;
  Major major;
  University university;
  String urlMeet;

  Talkshow({
    this.ID,
    this.image,
    this.timeStart,
    this.timeFinish,
    this.date,
    this.price,
    this.counselor,
    this.description,
    this.major,
    this.university,
    this.urlMeet,
  });

  static List<Talkshow> createListTalkshow() {
    List<String> listImage = [];
    listImage = [
      '',
      'https://kbvision.vn/wp-content/uploads/2020/07/kbvision-talkshow-2020-783x400-1.jpg',
      'https://daihoc.fpt.edu.vn/media/2020/09/dhfpttalkshow.jpg',
      'https://i.chungta.vn/2018/09/24/Hinhanh1-4251-1537778831.png',
      'https://caodang.fpt.edu.vn/wp-content/uploads/1-4.jpeg',
      'https://vtc.edu.vn/wp-content/uploads/2020/09/vtc-academy-talkshow-nghe-lap-trinh-game.jpg',
      'https://i.chungta.vn/2021/07/16/fpt640x390-1626403256.png',
      'https://media-api.advertisingvietnam.com/oapi/v1/media?uuid=dcbe035d-a668-4ed3-a5b5-46205c2f22f1&resolution=1440x756&type=image'
    ];
    List<Talkshow> list = [];
    Talkshow t1 = Talkshow(
      ID: 1,
      counselor: Counselor(
        ID: 1,
        address: '115 Đoàn Thị Điểm, Lộc Thanh',
        birthday: '03-07-1985',
        description: 'Tôi yêu màu xanh',
        email: 'trannamanh@gmail.com',
        fullName: 'Trần Nam Anh',
        gender: 'Nam',
        image:
            'https://vnuk.udn.vn/wp-content/uploads/2021/06/Poster-full-screen.png',
        phone: '0961191733',
      ),
      date: '2021-11-20',
      description: 'Buổi nói chuyện, tư vấn chọn trường phù hợp với bạn.',
      image: 'https://media.publit.io/file/talkshow/hutechtuyensinh.jpg',
      major: Major(
          id: 1, description: 'mnb', name: 'Chuyên ngành kĩ thuật phần mềm'),
      price: 3,
      timeStart: '03:00',
      timeFinish: '05:00 pm',
      university: University(
        ID: 1,
        code: 'FPT',
        description: 'Beautiful university',
        email: 'fpt@fpt.edu.vn',
        facebook: 'fpt@facebook.com',
        image: 'image',
        lastYearBenchMark: 21,
        listAddress: [],
        maxFee: 300000000,
        minFee: 200000000,
        name: 'Đại học FPT',
        website: 'fpt website',
      ),
    );
    list.add(t1);
    Talkshow t2 = Talkshow(
      ID: 1,
      counselor: Counselor(
        ID: 1,
        address: '115 Đoàn Thị Điểm, Lộc Thanh',
        birthday: '03-07-1985',
        description: 'Tôi yêu màu xanh',
        email: 'trannamanh@gmail.com',
        fullName: 'Trần Nam Anh',
        gender: 'Nam',
        image:
            'https://vnuk.udn.vn/wp-content/uploads/2021/06/Poster-full-screen.png',
        phone: '0961191733',
      ),
      date: '2021-11-20',
      description: 'Buổi nói chuyện, tư vấn chọn trường phù hợp với bạn.',
      image: 'https://media.publit.io/file/talkshow/RMIT-tuyen-sinh.png',
      major: Major(
          id: 1, description: 'mnb', name: 'Chuyên ngành kĩ thuật phần mềm'),
      price: 3,
      timeStart: '03:00',
      timeFinish: '05:00 pm',
      university: University(
        ID: 1,
        code: 'FPT',
        description: 'Beautiful university',
        email: 'fpt@fpt.edu.vn',
        facebook: 'fpt@facebook.com',
        image: 'image',
        lastYearBenchMark: 21,
        listAddress: [],
        maxFee: 300000000,
        minFee: 200000000,
        name: 'Đại học FPT',
        website: 'fpt website',
      ),
    );
    list.add(t2);
    Talkshow t3 = Talkshow(
      ID: 1,
      counselor: Counselor(
        ID: 1,
        address: '115 Đoàn Thị Điểm, Lộc Thanh',
        birthday: '03-07-1985',
        description: 'Tôi yêu màu xanh',
        email: 'trannamanh@gmail.com',
        fullName: 'Trần Nam Anh',
        gender: 'Nam',
        image:
            'https://vnuk.udn.vn/wp-content/uploads/2021/06/Poster-full-screen.png',
        phone: '0961191733',
      ),
      date: '2021-11-20',
      description: 'Buổi nói chuyện, tư vấn chọn trường phù hợp với bạn.',
      image: 'https://media.publit.io/file/talkshow/fpttalkshow.png',
      major: Major(
          id: 1, description: 'mnb', name: 'Chuyên ngành kĩ thuật phần mềm'),
      price: 3,
      timeStart: '03:00',
      timeFinish: '05:00 pm',
      university: University(
        ID: 1,
        code: 'FPT',
        description: 'Beautiful university',
        email: 'fpt@fpt.edu.vn',
        facebook: 'fpt@facebook.com',
        image: 'image',
        lastYearBenchMark: 21,
        listAddress: [],
        maxFee: 300000000,
        minFee: 200000000,
        name: 'Đại học FPT',
        website: 'fpt website',
      ),
    );
    list.add(t3);
    // for (int i = 0; i < 10; i++) {
    //   List<University> listUniversity = University.createListUniversity();
    //   Talkshow newTalkshow = Talkshow(
    //     ID: i + 1,
    //     image:
    //         'https://www.vjl.com.vn/img/baiviet/Talkshow-Bi-quyet-kh-fpkvo.png',
    //     timeStart: '${i + 1}0:20',
    //     timeFinish: '${i + 2}:20',
    //     date: ' on  20-10-2021',
    //     counselor: Counselor(
    //       ID: i,
    //       email: 'demo$i@gmail.com',
    //       fullName: 'Lê Văn Tài',
    //       phone: '096119173$i',
    //       image:
    //           'https://danongonline.com.vn/wp-content/uploads/2018/02/anh-girl-xinh-mat-moc-9.jpg',
    //       address:
    //           'A1$i/5 Đường sô 441, Lê Văn Việt, Quận 9, Thành Phố Thủ Đức',
    //       description: 'I am a handsome boy, I love pink and hate lies $i',
    //       gender: 'Male $i',
    //       birthday: '03/07/1998',
    //     ),
    //     price: i + 2,
    //     description:
    //         'This is a talkshow about FPT University. We have alot of story about this university.',
    //     major: Major(
    //       id: i,
    //       name: 'Software Engineer ($i)',
    //       listUniversity: listUniversity,
    //     ),
    //   );
    //   list.add(newTalkshow);
    // }
    return list;
  }
}
