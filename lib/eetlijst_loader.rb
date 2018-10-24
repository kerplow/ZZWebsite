module EetlijstLoader
  class Page
    def self.get_all_pdfs
      agent = get_agent
      # get the PDF link

      watan = []
      agent.get("http://elwatan.com/").parser.xpath('//div[2]/div/p/a/@href|/img').each do     |link|
        watan << link.text.strip
      end
      watan
    end


    def self.get_single_pdf(link_text)
      agent = get_agent
      # get the PDF link

      found_link= nil
      agent.get("http://elwatan.com/").parser.xpath('//div[2]/div/p/a/@href|/img').each do     |link|
        if link.text.strip = link_text
          found_link = link['href']
        end
      end

      pdf =
          if found_link
            # fetch pdf
            agent.get(found_link)
          end
    end

    def self.get_agent
      agent = Mechanize.new
      page = agent.get("http://www.eetlijst.nl")

      # login
      form = page.form_with(:name => 'loginform')
      form.login = "zzweten"
      form.pass = "ikbenjan"
      page = agent.submit form

      page
    end
  end
end