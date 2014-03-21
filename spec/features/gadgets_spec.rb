#encoding: utf-8
require 'spec_helper'

describe "Gadgets testing"   do
  
  before :each do
    create_sample_users
    

  end
  
  it "user can create a new gadget" , :js do

   user_login("guest@example.com", "guest123")
   visit root_path
   click_link "New"

   fill_in "gadget_name", :with => "gadget 1"
   fill_in "gadget_description", :with => " description gadget 1"
   click_link "Add image"
   within "#images" do
      id_input_file =  find("input[type='file']")['id']
      attach_file(id_input_file,"#{Rails.root}/app/assets/images/rails.png")
    end

   click_button "Send"

   page.should have_content "gadget 1"
   page.should have_content " description gadget 1"





  end


  it "user can delete a gadget" do
     user_login("guest@example.com", "guest123")
    gadget = create_gadget user_id: @current_user.id, description: "description created"
    visit gadget_path gadget
    click_link "delete"
    page.should_not have_content "description created"

  end


  it "user can see a list of his gadgets" do


   user_login("guest@example.com", "guest123")
    create_gadget user_id: @current_user.id, description: "description created"
    visit root_path
    page.should have_content "description created"

  end


  it "anyone can list all the gadgets" do 

    create_user 
    visit root_path


  end


end