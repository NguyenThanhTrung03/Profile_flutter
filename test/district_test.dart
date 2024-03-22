import 'package:test/test.dart';
import 'package:unit_test/Models/ward.dart';
import 'package:unit_test/Models/district.dart';
import 'package:unit_test/Models/province.dart';
void main() {
  group(
    'Test Province',
    () {
      test(
        'should return a Province instance',
        () {
          final province = Province(
            id: '1',
            name: 'Thành phố Hà Nội',
            level: '1',
          );

          expect(province, isA<Province>());
        },
      );
    },
  );
   group(
    'Test District',
    () {
      test(
        'should return a District instance',
        () {
          final district = District(
            id: '1',
            name: 'Huyện Ba Vì',
            level: '1',
            provinceId: '1',
          );

        expect(district, isA<District>());
        },
      );
    },
  );
  group(
    'Test Ward',
    () {
      test(
        'should return a Ward instance',
        () {
          final ward = Ward(
            id: '1',
            name: 'Xã Phú Châu',
            level: '1',
            districtId: '1',
          );

          expect(ward, isA<Ward>());
        },
      );
    },
  );
}
