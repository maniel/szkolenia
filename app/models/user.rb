class User < ActiveRecord::Base
  include Clearance::User
  resourcify
  rolify

  def admin
  	has_role? :admin
  end

  alias_method :admin?, :admin

  def admin=(a)
  	if a
  		add_role :admin
  	else
  		remove_role :admin
  	end
  end

  def doradca
  	has_role? :doradca, User
  end

  def doradca=(a)
  	if a
  		add_role :doradca, User
  	else
  		remove_role :doradca, User
  	end
  end

  alias_method :admin?, :admin

  alias_method :doradca?, :doradca

  def email_optional?
  	true
  end
end
