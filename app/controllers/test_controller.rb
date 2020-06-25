
class TestController < ApplicationController

  def search
    Google::Request.new("apple").get


    byebug

  end
end
