class JishoHelper::JishoBreen
  attr_reader :example1, :example2

  def initialize keyword
    enc_jp = keyword.encode(Encoding::EucJP)
    url_safe_word = URI.escape(enc_jp)
    word_url = breen_url url_safe_word
    raw_example = get_info(word_url)
    example = raw_example.search('pre').children[0]

    unless example.nil?
      assign_examples example.text
    else
      @example1 = 'N/A'
      @example2 = 'N/A'
    end
  end

  def assign_examples example
    example = example.split
    example.each_with_index do |letter, i|
      break if !@example1.nil? && !@example2.nil? 
      if letter == "A:"
        if i == 0 
          @example1 = example[i+1]
        else
          @example2 = example[i+1]
        end
      end
    end
  end
 
  def get_info url
    json_data = Nokogiri::HTML(open(url).read)
  end

  private

  def breen_url keyword
    enc_word = URI.encode(keyword)
    "http://nihongo.monash.edu/cgi-bin/wwwjdic?1ZEE" + keyword +"=1=kana"
  end
end
