class JishoHelper::JishoResult
  attr_accessor :kanji, :kana, :english, :def, :example1, :example2

  def initialize kana, kanji, _def, example1, example2, english
    @english =  english
    @kanji = kanji
    @kana = kana
    @def = _def
    @example1 = example1
    @example2 = example2
  end
end
