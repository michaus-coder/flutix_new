part of 'models.dart';

class Promo extends Equatable {
  final String title, subtitle;
  final int discount;
  Promo({
    required this.title,
    required this.discount,
    required this.subtitle,
  });
  @override
  List<Object> get props => [title, discount, subtitle];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Family Club",
      discount: 70,
      subtitle: "Minimal  for three members"),
  Promo(title: "Subscription", discount: 40, subtitle: "Min. one year"),
];
