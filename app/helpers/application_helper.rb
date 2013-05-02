#encoding: utf-8
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def meta_keywords(str)
    content_for(:meta_keywords) { str }
  end

  def meta_description(str)
    content_for(:meta_description) { str }
  end

  def current_city?(city)
    if session[:city] == city
      true
    else
      false
    end
  end

  def sidebar
    subdomain = request.subdomain
    @pages = Page.joins(:city).where('cities.subdomain' => subdomain, 'pages.sidebar' => true).order('pages.position desc')
    out = ''
    @pages.each do |page|
      out += "<li>#{link_to page.name, :controller => :pages, :action => :show, :id => page.permalink}</li>"
    end
    out.html_safe
  end

  def show_phones(subdomain)
    out = ""
    if !subdomain.blank? && subdomain != "www"
      @city = City.find_by_subdomain!(subdomain)
      @city.phones.each do |phone|
        out += "<span style='color:#000000; font-size:21px;'>#{image_tag 'icopho.gif'} #{phone.phone_number} </span><br/>"
      end
    end
    out.html_safe
  end

  def current_city
    session[:city]
  end

  def show_menu(menu)
    if menu == :top
      @out = get_pages(:top_menu)
    end
    if menu == :main
      @out = get_pages(:main_menu)
    end
    return @out
  end

  def city_choose
    @cities = City.all
    out = ''
    @cities.each do |city|
      out += "<li>#{link_to city.name, url_for(
          :subdomain => city.subdomain,
          :controller => :city,
          :action => :chose
      )}</li>"
    end
    out.html_safe
  end

  #method that render last news in the main page
  def view_last_news_helper
    out = ''
    @news = Newse.joins(:city).where('cities.subdomain' => request.subdomain).order('created_at desc').limit(8)
    if !@news.empty?
      @news.each do |news|
        out += "<li>"
        out += "<em class='date'>#{news.created_at}</em>"
        out += "#{link_to news.name, {:controller => :tidings, :action=>:show, :id => news.id, :subdomain => request.subdomain}}"
        out += "</li>"
      end
    else
      out += "<li>Извините, новостей не добавлено!"
      out += "</li>"
    end
    out.html_safe
  end

  #method that render catalog in the layout
  def view_catalog_helper
    @catalog = Article.joins(:city).where('cities.subdomain' => request.subdomain).order('position')
    out = "<ul class='menu'>"
    if !@catalog.empty?
      @catalog.each do |article|
        if article.red_class
          out += "<li>#{link_to article.name, article_path(article.permalink), :style => 'color:red;'}</li>"
        else
          out += "<li>#{link_to article.name, article_path(article.permalink)}</li>"
        end
      end
    else
      out += "<li>В каталоге выбранного города нет уcлуг!</li>"
    end
    out += "</ul>"
    out.html_safe
  end

  private

  def get_pages(menu)
    out = ''
    @pages = Page.joins(:city).where('cities.subdomain' => request.subdomain).where(menu => true)
    @pages.each do |item|
      out = out + "<li>#{link_to ('<span><i>'+item.name+'</i></span>').html_safe ,
          url_for(
              :controller => :pages,
              :action => :show,
              :id => item.permalink,
              :subdomain => request.subdomain
          )
      } </li>"
    end
    return out.html_safe
  end

end
