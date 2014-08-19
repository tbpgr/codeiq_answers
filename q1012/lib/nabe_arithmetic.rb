# encoding: utf-8

# 数列の和
#
# 一定サイズの数値の配列と加算値の配列の繰り返しからなる数列に関わる処理を扱う.
# 基本配列(bases): 繰り返しの基本となる数値の配列のことを指す
# 加算値配列(adds): 繰り返しごとに基本配列に加算する数値の配列。基本配列と同じサイズ
class NabeArithmetic
  # 基本配列のサイズ判定用の仮最大値
  PROVISIONAL_MAX_SIZE = 10

  # 基本配列のサイズの判定
  def detect_bases_size(numbers)
    [*1..PROVISIONAL_MAX_SIZE].each do |i|
      bases = numbers[0, i]
      nexts = numbers[i, i]
      adds = []
      adds = Array.new(bases.size){ |j| nexts[j] - bases[j] } 
      return i if detect?(numbers, bases, adds)
    end
    fail StandardError, 'detect error!'
  end

  # 基本配列/加算配列/繰り替えし数 を元に数列を取得
  def sequence(repeat_count, bases, adds)
    repeat_count.times.with_object([]) do |i, memo|
      bases.size.times { |j|memo << bases[j] + adds[j] * i }
    end
  end

  # 数列の和を算出
  def sum(sequence, from, to)
    sequence[from, to].reduce(&:+)
  end

  # 基本配列と数列のサイズを元に繰り返し回数を取得
  def repeat_count(bases, max)
    return max if bases.size == 1
    max / bases.size + 1
  end

  private

  def detect?(numbers, bases, adds)
    repeat_count = repeat_count(bases, numbers.size)
    detect_list = sequence(repeat_count, bases, adds)
    detect_list[0, numbers.size] == numbers
  end
end
