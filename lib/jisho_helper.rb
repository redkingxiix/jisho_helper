class JishoHelper
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'erb'
  require 'uri'
  include ERB::Util
  require 'jisho_helper/jisho_jisho'
  require 'jisho_helper/jisho_result'
  require 'jisho_helper/jisho_breen'
  require 'jisho_helper/jisho_tere'

  def look_up keyword
    japanese = true
    japanese = false if URI.encode(keyword) == keyword
    jisho = JishoHelper::JishoJisho.new(keyword)
    tere = JishoHelper::JishoTere.new(keyword, japanese)
    breen = JishoHelper::JishoBreen.new(jisho.kanji)
    result = JishoHelper::JishoResult.new(jisho.kana, jisho.kanji, tere.entry, breen.example1, breen.example2 ,keyword)
  end
end
