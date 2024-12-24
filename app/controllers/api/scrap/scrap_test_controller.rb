require "http"
require "nokogiri"

class Api::Scrap::ScrapTestController < ApplicationController
    def index
        url = "https://example.com"
        response = HTTP.get(url)

        if response.status.success?
            html_content = response.body.to_s

            doc = Nokogiri::HTML(html_content)

            render json: {
                "data"=> "Page Title: #{doc.at_css('title').text}"
            }
        else
            render json: {
                "data"=> "Failed to fetch HTML: #{response.status}"
            }
        end
    end
end
