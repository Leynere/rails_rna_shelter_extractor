class Api::Scrap::AssociationController < ApplicationController
    def index
        render json: "ok"
    end
    def create
        render json: GouvDataExtractor.extract(params[:url])
    end
end
