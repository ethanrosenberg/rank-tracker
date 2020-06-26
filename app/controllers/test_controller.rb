
class TestController < ApplicationController

  def search
    Google::Request.new("cv noise while driving").get


    byebug

  end
end
