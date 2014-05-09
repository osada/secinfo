# -*- coding: utf-8 -*-
require 'sinatra'
require 'sinatra/reloader'

get '/' do
   	@f = File.open('news.dat')
	erb :index
end
