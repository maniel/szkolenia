# coding: utf-8
class ApplicationController < ActionController::Base
  include Clearance::Controller
  def flash_failure_after_create
  	flash.now[:notice] = "Złe hasło!"
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
