class User < ActiveRecord::Base
  rolify
  include Clearance::User


  def email_optional?
  	true
  end
end
