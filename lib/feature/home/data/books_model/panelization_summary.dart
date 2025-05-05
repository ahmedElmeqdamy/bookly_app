class PanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json['containsEpubBubbles'],
        containsImageBubbles: json['containsImageBubbles'],
      );

  Map<String, dynamic> toJson() => {
    'containsEpubBubbles': containsEpubBubbles,
    'containsImageBubbles': containsImageBubbles,
  };
}
