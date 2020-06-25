require 'typhoeus'
require 'nokogiri'
require 'json'


  module Google
    class Request

    def initialize(query)
      @search_query = populate_query(query)

    end

    def populate_query(query)
      query_has_spaces = query.match(/\s/) ? true : false
      if query_has_spaces
        return query.gsub ' ', '%20'
      else
        return query
      end
    end

    def get
      Typhoeus::Config.verbose = false

      new_query = "http://api.scraperapi.com/?api_key=#{ENV['SCRAPER_API_KEY']}&url=https://www.google.com/search?q=#{@search_query}&country_code=us"

      request = Typhoeus::Request.new(
        new_query
      ).run

      html = request.response_body

      parse_results(html)

      end

      def parse_results(html)
        parsed_html = Nokogiri::HTML.parse(html)

        elements = parsed_html.xpath("//div[@class='rc']")

        data = []
        elements.each do |serp|
          title = serp.xpath(".//div[@class='r']/a/h3").text
          description = serp.xpath(".//div[@class='s']/div/span").text
          url = serp.xpath(".//div[@class='r']/a/@href").text

          result = {
            title: title,
            description: description,
            url: url
          }

          data << result
      end

      File.open("test_serp.json","w") do |f|

        f.write(JSON.pretty_generate(data))
      end

    end

  end
  end
