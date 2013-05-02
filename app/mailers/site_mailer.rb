# encoding: utf-8
class SiteMailer < ActionMailer::Base
  default from: "alekseenkoss@gmail.com"

  def send_vacancy(vacancy, city)
    @vacancy = vacancy
    @city  = city.name
    mail(
        :to => email_from_city(city).to_s,
        :subject => "Новая вакансия"
    )
  end

  def send_order(order, city)
    @order = order
    @city = city.name
    mail(
        :to => email_from_city(city).to_s,
        :subject => "Новая заявка"
    )
  end
  
  def send_order_to_boss(order, city)
	@order = order
    @city = city.name
    mail(
        :to => "ba-boss@yandex.ru",
        :subject => "Жалоба"
    )
  end
  
  private
  def email_from_city(city)
    if city.email
      return city.email
    end
    render :text => "E-mail для данного города не существует, либо отсутствует!"
  end
end
