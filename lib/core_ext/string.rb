class String
  CN_DIGITS = %W(零 一 二 三 四 五 六 七 八 九 十).freeze
  CN_UNITS = %W(年 月 日)

  alias old_to_date to_date

  def to_date
    old_to_date
  rescue ArgumentError
    #TODO: translate to english
  end


  private

  def alter_unit
    #TODO: alter chinese unit
  end
end
