#encoding: utf-8
require 'spec_helper'

describe "Users testing"   do
  
  before :each do
	sleep 1
    create_sample_users
    

  end
  
  it "user can loggin" do


  	user_login "guest@example.com", "guest123"



  end


  pending "user loggout" do

  end




end