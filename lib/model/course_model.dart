class Course {
  final String name;
  final String description;
  final String cost;

  Course(this.name, this.description, this.cost);
}

List<Course> courseList = [
  Course(
      'دورة التسويق الرقمي',
      'تغطي هذه الدورة استراتيجيات التسويق الرقمي بما في ذلك SEO وSEM والتسويق عبر البريد الإلكتروني والتسويق عبر وسائل التواصل الاجتماعي.',
      '500'),
  Course(
      'دورة الذكاء الصناعي في التسويق',
      'تركز هذه الدورة على كيفية استخدام الذكاء الصناعي في تحليل البيانات وتحديد السوق المستهدف وتخصيص العروض وتحسين تجربة المستخدم.',
      '600'),
  Course(
      'دورة تصميم المتاجر الإلكترونية',
      'تعلم كيفية تصميم وبناء متاجر إلكترونية متميزة باستخدام منصات مثل Shopify أو WooCommerce وتحسين تجربة التسوق عبر الإنترنت.',
      '550'),
  Course(
      'دورة بناء فريق العمل ',
      ' تركز هذه الدورة على كيفية بناء فريق عمل فعال وإدارته بشكل فعال، بالإضافة إلى العمل مع الشبكة والتعامل مع شروط العمل المتغيرة.',
      '250'),
];
