require 'nokogiri'
require 'open-uri'

class Company < ApplicationRecord
  self.table_name = 'companies'
  searchkick language: "japanese"

  def self.crawl_data
    [*1..20].each do |index|
      doc = Nokogiri::HTML.parse(open("https://baseconnect.in/companies/category/377d61f9-f6d3-4474-a6aa-4f14e3fd9b17?page=#{index}").read)
      doc.css(".searches__result__list").each do |parent|
        name = parent.css(".searches__result__list__header .searches__result__list__header__title").text.strip
        type_company = parent.css(".searches__result__list__header .searches__tag--listed").text.strip
        avatar = parent.css(".searches__result__list__conts .searches__result__list__conts__thumb img")[0].values[1].strip
        title = parent.css(".searches__result__list__conts .searches__result__list__conts__text__heading").text.strip
        content = parent.css(".searches__result__list__conts .searches__result__list__conts__text__excerpt").text.strip
        address = parent.css(".searches__result__list__conts .searches__result__list__conts__text__address").text.strip

        Company.find_or_create_by!(name: name, type_company: type_company, avatar: avatar, title: title, content: content, address: address)
      end
    end
  end
end
