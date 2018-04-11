require 'open-uri'
class HomeController < ApplicationController
  def crawler
    Result.all.destroy_all
      url = params[:url] + '/issues'
      doc = Nokogiri::HTML(open(url))
      @posts = doc.css('ul li.js-issue-row')
      @posts.each do |x|
        tit = x.css('.lh-condensed a').text.strip
        logger.debug(x.css('.lh-condensed a')[0]['href'])
        sub_url = 'https://github.com' + x.css('.lh-condensed a')[0]['href']
        sub_doc = Nokogiri::HTML(open(sub_url))
        cont = sub_doc.css('.comment-body').text.strip
        @res = Result.new(title: tit, content: cont)
        @res.save
      end

    redirect_to '/'
  end

  def show
    @pr = Result.all
  end
end
