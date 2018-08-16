require 'nokogiri'
require 'open-uri'
require 'csv'

desc "Envoi de mailing aux députés !"
task bot_mailling: :environment do

  def get_the_email_of_a_townhal_from_its_webpage(url)
      page = Nokogiri::HTML(open(url))
      page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end


    @town_names = []
    @town_emails = []
    urls = %w[http://www.annuaire-des-mairies.com/manche.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end

    urls = %w[http://www.annuaire-des-mairies.com/manche-2.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end

    urls = %w[http://www.annuaire-des-mairies.com/manche-3.html]

    urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css(".lientxt").each do |link|
      url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
      town_name = link.text
      town_email = get_the_email_of_a_townhal_from_its_webpage(url)
      @town_names << town_name
      @town_emails << town_email
      end
    end

    USERNAME = ENV["YOUR_EMAIL"]
    PASSWORD = ENV["YOUR_PASSWORD"]

    gmail = Gmail.connect(USERNAME, PASSWORD)

        @town_emails.each do |mail|
        gmail.deliver do
        to mail
          subject "Apprendre à coder c'est cool"
          html_part do
          content_type 'text/html; charset=UTF-8'
            body "<p>Bonjour,<br>
              Je nous sommes des élèves de The Hacking Project, une formation au code gratuite,
              sans locaux, sans sélection, sans restriction géographique.<br></p>
              <p>Pour plus d'information cliquer sur ce lien</p>
              <p>Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
          end
             sleep(60)
          end
        end
     gmail.logout
  end
