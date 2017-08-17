class JishoHelper::JishoJisho
  attr_reader :kana, :kanji

  def initialize keyword
    word_url = jisho_url keyword
    json_data = JSON.parse(get_info(word_url))

    unless json_data['data'].empty?
      @kanji = json_data['data'][0]['japanese'][0]['word']
      @kana = json_data['data'][0]['japanese'][0]['reading']
    else
      @kanji = 'N/A'
      @kana = 'N/A'
    end
  end
 
  def get_info url
    json_data = Nokogiri::HTML(open(url).read)
  end

  private

  def jisho_url keyword
     keyword = URI.encode(keyword)
    "http://beta.jisho.org/api/v1/search/words?keyword=" + keyword 
  end
end
