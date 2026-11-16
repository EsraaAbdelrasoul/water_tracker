double calculateWaterLitres({
  required int weightKg,
  required double activityHours,
}) {
  double baseMl = weightKg * 35;
  double activityMl = activityHours * 250;
  return (baseMl + activityMl) / 1000;
}
