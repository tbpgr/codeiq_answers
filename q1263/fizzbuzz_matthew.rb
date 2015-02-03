# マシュー社交辞令モジュール
module ForMatthewPoliteness
  # 本音
  module RealIntention
    HATE = '大嫌い'
    STAY_AWAY = '近寄らないで'
  end

  # 建前
  module Tatemae
    # 建前マッピングに本音を与えると建前を得られる
    TATEMAE_MAPPING = {
      RealIntention::HATE => '大好き',
      RealIntention::STAY_AWAY => '抱いて！',
    }
  end
end

FMP = ForMatthewPoliteness
matthew_fizzbuzz = Enumerator.new { |y|
  a = 1
  loop {
    ret = case
    when a % 15 == 0 then FMP::Tatemae::TATEMAE_MAPPING[FMP::RealIntention::STAY_AWAY]
    when a % 5 == 0 then FMP::Tatemae::TATEMAE_MAPPING[FMP::RealIntention::HATE]
    when a % 3 == 0 then 'マシュー'
    else a
    end
    y << ret
    a += 1
  }
}

print matthew_fizzbuzz.take(100).join(',')
