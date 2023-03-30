class HelpController < ApplicationController
  def help
    render "help/#{params[:first]}"
  end
end