#encoding: utf-8
class VacanciesController < ApplicationController
  # GET /vacancies
  # GET /vacancies.json


  # GET /vacancies/new
  # GET /vacancies/new.json
  def new
    @vacancy = Vacancy.new
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(params[:vacancy])
    @city = City.find_by_subdomain!(current_city)
    respond_to do |format|
      if @vacancy.save
        SiteMailer.send_vacancy(@vacancy, @city).deliver
        format.html { redirect_to :controller => :pages, :action => :show, :id => "main", notice: 'Вакансия была отправлена' }
        format.json { render json: @vacancy, status: :created, location: @vacancy }
      else
        format.html { render action: "new" }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end
end
