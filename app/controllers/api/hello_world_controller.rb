class Api::HelloWorldController < ApplicationController
    def index
        render json: {
            "data"=> "Hello World!"
        }
    end
end
