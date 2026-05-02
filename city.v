module city (
    input first_clk, 
    input socand_reset,
  output [1:0] first_road_light, 
  output [1:0] socand_road_light
);

    // 1. استدعاء الإشارة الأولى (للشارع الرئيسي)
    // سنغير الوقت ليكون أطول (مثلاً 15 نبضة)
    Traffic #(
      .TIME_LIMIT(3) 
    ) main_signal (
        .clk(first_clk),
        .reset(socand_reset),
        .resilt(first_road_light)
    );

    // 2. استدعاء الإشارة الثانية (للشارع الفرعي)
    // سنترك الوقت افتراضي كما هو في المودول الأصلي
    // وسنغير فقط ترتيب الألوان لأغراض التصميم
    Traffic #(
        .Green(2'b10), // نغير تعريف الأخضر هنا فقط لهذه الإشارة
        .Red(2'b00),
      .TIME_LIMIT(3)
    ) side_signal (
        .clk(first_clk),
        .reset(socand_reset),
        .resilt(socand_road_light)
    );

endmodule