class User < ActiveRecord::Base
  rolify
  resourcify
  include Clearance::User


  def email_optional?
  	true
  end
end
