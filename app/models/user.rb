class User < ActiveRecord::Base
  include Clearance::User


  def email_optional?
  	true
  end
end
