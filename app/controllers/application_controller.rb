
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do # routes, HTTP Verb,URL,Block
    erb :index
  end

  get '/articles' do
    @all_articles = Article.all

    erb :index # renders the index view
  end

  get '/new' do #produces a form to create a new article obj
    erb :new
  end

  post '/articles' do #creates a new article obj, from form
      #binding.pry
     @new_article = Article.new({title: params[:title],content: params[:content]})
     @new_article.save
     @new_article.delete

     redirect "/articles/#{@new_article.id}"
  end

  get '/articles/:id' do #Show route, display one article obj, 
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do #lets you find article by :id to edit
    @article = Article.find(params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do # lets you edit and save article
    article = Article.find(params[:id].to_i)
    article.update(title: params[:title])
    article.update(content: params[:content])
    article.save

     redirect "/articles/#{id}"
  end

  delete '/articles/:id/delete' do #lets you find article obj by :id and deletes it and stores record of it
    article = Article.find(params[:id].to_i)
    @title = article.title
    article.destroy

    erb :delete
  end
end
      


  


  
