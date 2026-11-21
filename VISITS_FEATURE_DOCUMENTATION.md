# ميزة الزيارات (Visits Feature) - توثيق شامل

## نظرة عامة

ميزة الزيارات هي أحد المكونات الأساسية في تطبيق OK Tech التي تسمح للمندوبين بتتبع زياراتهم للعملاء، بما في ذلك تسجيل أوقات الدخول والخروج، والمواقع الجغرافية، والملاحظات.

## الهيكل العام للميزة

```
lib/features/visits/
├── data/
│   ├── models/
│   │   ├── client_visit_model.dart        # نموذج بيانات الزيارة
│   │   ├── client_visit_model.freezed.dart # ملف مُولد بواسطة Freezed
│   │   └── client_visit_model.g.dart      # ملف مُولد بواسطة JSON Annotation
│   └── repo/
│       └── visits_repository.dart         # مستودع البيانات للزيارات
├── logic/
│   ├── visits_cubit.dart                  # إدارة الحالة باستخدام Bloc/Cubit
│   ├── visits_cubit.freezed.dart          # ملف مُولد
│   └── visits_state.dart                  # تعريف حالات الزيارات
└── ui/
    ├── check_in_screen.dart               # شاشة بدء الزيارة
    └── widgets/
        ├── check_in_out_button.dart       # زر بدء/إنهاء الزيارة
        ├── client_selection_widget.dart   # ودجت اختيار العميل
        └── visit_status_card.dart         # بطاقة عرض حالة الزيارة
```

## 1. طبقة البيانات (Data Layer)

### نموذج الزيارة (ClientVisit Model)

**الملف:** `lib/features/visits/data/models/client_visit_model.dart:10`

```dart
@freezed
abstract class ClientVisit with _$ClientVisit {
  const factory ClientVisit({
    required String id,              // معرف فريد للزيارة
    required String clientId,        // معرف العميل
    String? clientName,             // اسم العميل
    required String salesmanId,      // معرف المندوب
    String? salesmanName,           // اسم المندوب
    required DateTime checkInTime,   // وقت الدخول
    DateTime? checkOutTime,         // وقت الخروج (اختياري)
    required double checkInLatitude, // خط العرض للدخول
    required double checkInLongitude,// خط الطول للدخول
    double? checkOutLatitude,       // خط العرض للخروج
    double? checkOutLongitude,      // خط الطول للخروج
    String? checkInAddress,         // عنوان الدخول
    String? checkOutAddress,        // عنوان الخروج
    String? notes,                  // ملاحظات
    @Default(VisitStatus.checkedIn) VisitStatus status, // حالة الزيارة
    String? purpose,                // غرض الزيارة
    List<String>? attachments,      // مرفقات
    DateTime? createdAt,            // تاريخ الإنشاء
    DateTime? updatedAt,            // تاريخ آخر تحديث
  }) = _ClientVisit;
}
```

#### حالات الزيارة (Visit Status)

```dart
enum VisitStatus { 
  checkedIn,   // داخل عند العميل
  checkedOut,  // انتهت الزيارة
  cancelled    // ملغاة
}
```

#### الوظائف المساعدة

- **`visitDuration`**: حساب مدة الزيارة
- **`visitDurationFormatted`**: عرض المدة بالعربية (مثل: "2س 30د")
- **`isActive`**: التحقق من كون الزيارة نشطة
- **`statusText`**: نص حالة الزيارة بالعربية
- **`distanceBetweenCheckpoints()`**: حساب المسافة بين نقطتي الدخول والخروج

### مستودع الزيارات (Visits Repository)

**الملف:** `lib/features/visits/data/repo/visits_repository.dart:7`

يدير جميع عمليات البيانات المتعلقة بالزيارات باستخدام `SharedPreferences` للتخزين المحلي.

#### الوظائف الأساسية:

##### 1. بدء زيارة جديدة
```dart
Future<ClientVisit> checkIn({
  required String clientId,
  required String clientName,
  required String salesmanId,
  String? salesmanName,
  String? purpose,
  String? notes,
}) async
```

**المراحل:**
- التحقق من عدم وجود زيارة نشطة
- الحصول على الموقع الحالي
- إنشاء زيارة جديدة
- حفظها في التخزين المحلي

##### 2. إنهاء الزيارة
```dart
Future<ClientVisit> checkOut({
  String? notes,
  List<String>? attachments,
}) async
```

**المراحل:**
- الحصول على الزيارة الحالية
- تسجيل موقع الخروج
- تحديث بيانات الزيارة
- مسح الزيارة من الحالة النشطة

##### 3. وظائف أخرى:
- **`getCurrentVisit()`**: الحصول على الزيارة النشطة الحالية
- **`getAllVisits()`**: الحصول على سجل جميع الزيارات
- **`getClientVisits(clientId)`**: الحصول على زيارات عميل محدد
- **`getVisitStats()`**: إحصائيات الزيارات
- **`cancelCurrentVisit(reason)`**: إلغاء الزيارة الحالية

## 2. طبقة المنطق (Logic Layer)

### إدارة الحالة (Visits Cubit)

**الملف:** `lib/features/visits/logic/visits_cubit.dart:9`

```dart
class VisitsCubit extends Cubit<VisitsState> {
  final VisitsRepository _visitsRepository;
  
  // الوظائف الأساسية
  Future<void> initialize() async           // تحميل الحالة الأولية
  Future<void> checkIn({...}) async        // بدء زيارة
  Future<void> checkOut({...}) async       // إنهاء زيارة
  Future<void> cancelVisit({...}) async    // إلغاء زيارة
}
```

### حالات الزيارات (Visits State)

**الملف:** `lib/features/visits/logic/visits_state.dart:4`

```dart
@freezed
class VisitsState with _$VisitsState {
  const factory VisitsState.initial() = _Initial;
  const factory VisitsState.loading() = _Loading;
  const factory VisitsState.loaded({
    ClientVisit? currentVisit,
    required Map<String, dynamic> visitStats,
    String? message,
  }) = _Loaded;
  const factory VisitsState.error(String message) = _Error;
}
```

## 3. طبقة واجهة المستخدم (UI Layer)

### شاشة بدء الزيارة (Check-in Screen)

**الملف:** `lib/features/visits/ui/check_in_screen.dart:11`

#### الميزات:
- اختيار العميل من قائمة
- تحديد غرض الزيارة (اختياري)
- إضافة ملاحظات (اختياري)
- التحقق من صحة البيانات قبل بدء الزيارة

#### أغراض الزيارة المتاحة:
- زيارة روتينية
- متابعة طلب
- تحصيل مستحقات
- عرض منتجات جديدة
- حل مشكلة
- أخرى

### ودجت اختيار العميل

**الملف:** `lib/features/visits/ui/widgets/client_selection_widget.dart:9`

#### الميزات:
- البحث عن العملاء
- عرض معلومات العميل (الاسم، العنوان، النوع)
- تمييز العميل المختار
- واجهة سهلة الاستخدام

### زر بدء/إنهاء الزيارة

**الملف:** `lib/features/visits/ui/widgets/check_in_out_button.dart:11`

#### الحالات:
- **غير نشط**: زر بدء زيارة جديدة
- **نشط**: زر إنهاء الزيارة مع مؤشر بصري
- **تحميل**: مؤشر التحميل
- **خطأ**: حالة الخطأ

### بطاقة حالة الزيارة

**الملف:** `lib/features/visits/ui/widgets/visit_status_card.dart:11`

#### العرض:
- معلومات الزيارة النشطة
- مدة الزيارة (محدثة في الوقت الفعلي)
- خيارات إدارة الزيارة (إنهاء، إلغاء)
- واجهة جذابة بصرياً

## 4. خدمات داعمة

### خدمة الموقع (Location Service)

**الملف:** `lib/core/services/location_service.dart:4`

#### الوظائف:
- **`getCurrentLocation()`**: الحصول على الموقع الحالي
- **`requestLocationPermission()`**: طلب صلاحية الموقع
- **`getAddressFromCoordinates()`**: تحويل الإحداثيات إلى عنوان
- **`calculateDistance()`**: حساب المسافة بين نقطتين
- **`isWithinRange()`**: التحقق من وجود الموقع في نطاق محدد

## 5. ميزات الأمان والجودة

### التحقق من الصلاحيات
- طلب صلاحية الموقع قبل بدء الزيارة
- التعامل مع حالات رفض الصلاحيات
- رسائل خطأ واضحة للمستخدم

### التحقق من صحة البيانات
- التأكد من اختيار عميل قبل بدء الزيارة
- التحقق من عدم وجود زيارة نشطة قبل بدء زيارة جديدة
- التعامل مع الأخطاء بطريقة آمنة

### تخزين البيانات
- استخدام `SharedPreferences` للتخزين المحلي
- تشفير معرفات الزيارات باستخدام UUID
- حفظ سجل كامل لجميع الزيارات

## 6. الإحصائيات والتقارير

### إحصائيات متاحة:
- **`totalVisits`**: إجمالي عدد الزيارات
- **`completedVisits`**: عدد الزيارات المكتملة
- **`averageDuration`**: متوسط مدة الزيارة (بالدقائق)
- **`todayVisits`**: زيارات اليوم
- **`thisWeekVisits`**: زيارات الأسبوع

## 7. حالات الاستخدام

### 1. بدء زيارة جديدة
1. المستخدم ينقر على زر "بدء زيارة"
2. يفتح شاشة اختيار العميل
3. يختار عميل من القائمة
4. يضيف غرض الزيارة والملاحظات (اختياري)
5. يبدأ الزيارة بتسجيل الموقع والوقت

### 2. إنهاء زيارة
1. المستخدم ينقر على زر "إنهاء الزيارة"
2. يضيف ملاحظات نهائية (اختياري)
3. يسجل موقع ووقت الخروج
4. تحديث إحصائيات الزيارات

### 3. إلغاء زيارة
1. المستخدم ينقر على "إلغاء الزيارة"
2. يؤكد الإلغاء
3. تسجل الزيارة كملغاة مع السبب

## 8. اعتبارات التطوير المستقبلي

### التحسينات المقترحة:
- إضافة مزامنة مع الخادم
- تحسين دقة تحديد الموقع
- إضافة إشعارات تذكيرية
- تقارير أكثر تفصيلاً
- إضافة صور للزيارات
- تتبع المسار أثناء الزيارة

### المشاكل المعروفة:
- عدم وجود مزامنة مع الخادم حالياً
- الاعتماد على معرفات ثابتة للمندوبين (TODO: الحصول من نظام المصادقة)
- بيانات العملاء الوهمية في ودجت الاختيار

## 9. مخططات التدفق

### تدفق بدء الزيارة:
```
فتح الشاشة → اختيار العميل → إدخال التفاصيل → التحقق من الموقع → بدء الزيارة
```

### تدفق إنهاء الزيارة:
```
نقر زر الإنهاء → إضافة ملاحظات → تسجيل الموقع → حفظ البيانات → تحديث الإحصائيات
```

هذا التوثيق يغطي جميع جوانب ميزة الزيارات في التطبيق ويوفر فهماً شاملاً لكيفية عمل النظام وتنظيمه.