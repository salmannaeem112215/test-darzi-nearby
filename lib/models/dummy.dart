import 'models.dart';

abstract class _Dummy<T> {
  T get i1 => items[0];
  T get i2 => items[1];
  T get i3 => items[2];
  T get i4 => items[3];

  List<T> get items;
}

class DummyData {
  static final services = _DummyService();
  static final darzi = _DummyDarzi();
}

class _DummyService extends _Dummy<ServiceInfo> {
  @override
  List<ServiceInfo> get items => _items;
  final _items = [
    ServiceInfo(
        description: '',
        serviceName: 'Pent',
        serviceImageUrl:
            "https://lh3.googleusercontent.com/a-/ALV-UjUr-x3CASqPerdvVM0ntJ3ExItdD3vyeI5lyJ-ZJNlQvR4=w54-h54-p-rp-mo-br100"),
    ServiceInfo(
        description: '',
        serviceName: 'Shirt',
        serviceImageUrl:
            "https://lh3.googleusercontent.com/a-/ALV-UjW2HVkRSVHpcl5BTzk93BMdwCmCSSRfCSSzXriRiEPeJiI=w54-h54-p-rp-mo-br100"),
    ServiceInfo(
        description: '',
        serviceName: "Pent-Coat",
        serviceImageUrl:
            "https://lh3.googleusercontent.com/a-/ALV-UjXIbQ6kkUxCHM_mqNWYUESlS7htvNc85GdLE1SPhV32JkGk=w54-h54-p-rp-mo-br100"),
    ServiceInfo(
        description: '',
        serviceName: "Shalwar Qameez",
        serviceImageUrl:
            "https://lh3.googleusercontent.com/a-/ALV-UjXIbQ6kkUxCHM_mqNWYUESlS7htvNc85GdLE1SPhV32JkGk=w54-h54-p-rp-mo-br100"),
  ];
}

class _DummyDarzi extends _Dummy<DarziInfo> {
  @override
  List<DarziInfo> get items => _items;
  final _items = [
    DarziInfo(
      optionalImages: [],
      uid: "1",
      fullname: 'Nadeem Tailoring House',
      address:
          'Ghazali Rd, near khizra masjid, Samanabad Town, Lahore, Punjab 54570, Pakistan',
      locationUrl: "https://maps.app.goo.gl/uiRQN12khCS2NSYx8",
      phoneNo: "04237595289",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipO7IrmKr_MHM_EQD5Wx2YMTdoobqYW_HaE4MR48=w408-h544-k-no",
      cordinates: [31.533616800000004, 74.30413269573164],
      services: [
        DummyData.services.i1,
        DummyData.services.i2,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "1",
      fullname: 'Hassan Tailor',
      address:
          "G8J2+4CP, Fazal e Haq Rd, Chauhdry Colony Samanabad Town, Lahore, Punjab 54000, Pakistan",
      locationUrl: "https://maps.app.goo.gl/WXNb1zegnCwxJsgG6",
      phoneNo: "04237530275",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipM-tN9aHlDICu1v_t8V_iSIRwrvNQV-mCMa4OUD=w408-h544-k-no",
      cordinates: [31.530325999384974, 74.30104433282507],
      services: [
        DummyData.services.i3,
        DummyData.services.i4,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "2",
      fullname: 'JM Tailors for Men',
      address:
          "JM Tailors for men, Samanabad Town, Lahore, Punjab 54500, Pakistan",
      locationUrl: "https://maps.app.goo.gl/QZLahFeiS86jEg6h9",
      phoneNo: "03238841677",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipNyItUJpJPxnSnuAMn22Com_2Bo8Ic9TGLrPuqk=w408-h306-k-no",
      cordinates: [31.540810030363808, 74.30331652391195],
      services: [
        DummyData.services.i1,
        DummyData.services.i3,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "3",
      fullname: "Men's Tailor",
      address:
          "Shop 1, Street 2, Naya pull, Muslimabad Tajpura, Lahore, Punjab 54000, Pakistan",
      locationUrl: "https://maps.app.goo.gl/t2KCXtSVzmZsy37y8",
      phoneNo: "03004142411",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipORNGXG6-4xXZo9Oqh1ThOlG-PmuUTWq2s8qghm=w408-h272-k-no",
      cordinates: [31.565944968845287, 74.4009757756449],
      services: [
        DummyData.services.i2,
        DummyData.services.i4,
      ],
    ),

    //  GARI SAHU DARZI
    DarziInfo(
      optionalImages: [],
      uid: "4",
      fullname: 'Nadeem Tailoring House',
      address:
          'Ghazali Rd, near khizra masjid, Samanabad Town, Lahore, Punjab 54570, Pakistan',
      locationUrl: "https://maps.app.goo.gl/uiRQN12khCS2NSYx8",
      phoneNo: "04237595289",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipO7IrmKr_MHM_EQD5Wx2YMTdoobqYW_HaE4MR48=w408-h544-k-no",
      cordinates: [31.558302479373708, 74.35233290910593],
      services: [
        DummyData.services.i1,
        DummyData.services.i2,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "5",
      fullname: 'Hassan Tailor',
      address:
          "G8J2+4CP, Fazal e Haq Rd, Chauhdry Colony Samanabad Town, Lahore, Punjab 54000, Pakistan",
      locationUrl: "https://maps.app.goo.gl/WXNb1zegnCwxJsgG6",
      phoneNo: "04237530275",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipM-tN9aHlDICu1v_t8V_iSIRwrvNQV-mCMa4OUD=w408-h544-k-no",
      cordinates: [31.561761619045544, 74.34784812247648],
      services: [
        DummyData.services.i3,
        DummyData.services.i4,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "6",
      fullname: 'JM Tailors for Men',
      address:
          "JM Tailors for men, Samanabad Town, Lahore, Punjab 54500, Pakistan",
      locationUrl: "https://maps.app.goo.gl/QZLahFeiS86jEg6h9",
      phoneNo: "03238841677",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipNyItUJpJPxnSnuAMn22Com_2Bo8Ic9TGLrPuqk=w408-h306-k-no",
      cordinates: [31.559212669924797, 74.34865895343309],
      services: [
        DummyData.services.i1,
        DummyData.services.i3,
      ],
    ),
    DarziInfo(
      optionalImages: [],
      uid: "7",
      fullname: "Men's Tailor",
      address:
          "Shop 1, Street 2, Naya pull, Muslimabad Tajpura, Lahore, Punjab 54000, Pakistan",
      locationUrl: "https://maps.app.goo.gl/t2KCXtSVzmZsy37y8",
      phoneNo: "03004142411",
      userImgUrl:
          "https://lh5.googleusercontent.com/p/AF1QipORNGXG6-4xXZo9Oqh1ThOlG-PmuUTWq2s8qghm=w408-h272-k-no",
      cordinates: [31.56111736431647, 74.36012074252639],
      services: [
        DummyData.services.i2,
        DummyData.services.i4,
      ],
    ),
  ];
}
