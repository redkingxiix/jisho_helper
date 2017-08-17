class JishoHelper::JishoTere
  attr_reader :entry

  def initialize keyword, japanese
    if japanese 
      return @entry = 'N/A'
    else
      id_url = tere_url keyword
      id_doc = parse_xml id_url
      unless  id_doc.search('ItemID').empty?
        id =  id_doc.search('ItemID').first.inner_text 
        unless id.to_i == 0
          word_url = tere_id_url id
          word_doc = parse_xml word_url
          word = word_doc.search('Body').children[1].text rescue nil
          word.gsub!(/(\r\n|\r|\n|\t|\s)/, '')
          @entry = word
        end
      else
        @entry = "N/A"
      end
    end
  end

  private

  def get_tere_id doc
   item_id = doc.search('ItemID').first.inner_text rescue nil
   return nil unless item_id 
  end

  def parse_xml url
    xml = open(url).read
    doc = Nokogiri::XML(xml)
  end
 
  def tere_url keyword
    enc_word = URI.encode(keyword)
    url = "http://public.dejizo.jp/NetDicV09.asmx/SearchDicItemLite?Dic=EJdict&Word=#{enc_word}&Scope=HEADWORD&Match=EXACT&Merge=OR&Prof=XHTML&PageSize=20&PageIndex=0"
  end

  def tere_id_url id
    "http://public.dejizo.jp/NetDicV09.asmx/GetDicItemLite?Dic=EJdict&Item=#{id}&Loc=&Prof=XHTML"
  end
end
