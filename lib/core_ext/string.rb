class String
  CN_DIGITS = %W(零 一 二 三 四 五 六 七 八 九 十).freeze
  CN_UNITS = %W(年 月)

  alias old_to_date to_date

  def to_date
    if include?('年') && include?('月') && include?('日')
      alter_unit
      alter_cn_digits
    end
    old_to_date
  end


  private

  def alter_unit
    gsub!(/[#{CN_UNITS}]/, '-')
  end

  def alter_cn_digits
    each_char do |char|
      if char == '十'
        gsub! char, '0'
        next
      end

      if CN_DIGITS.include? char
        gsub! char, CN_DIGITS.index(char).to_s
      end
    end

    gsub!(/\-(\d+{3})/) do |m|
      m.gsub '0', ''
    end

    gsub!(/\-0/, '10')
  end
end
