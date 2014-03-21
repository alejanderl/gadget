# encoding: utf-8

module TestHelpers



  def user_logout
    within "#user_nav" do 

      first("i").click

    end

    click_link "sign out"

  end
 
  def user_login (email, password)

    visit new_user_session_path
    fill_in "user_email"   , :with => email
    fill_in "user_password", :with => password  
    click_button "Sign in" 
  	# fakes current user in test scope
    @current_user = User.find_by_email email

  end

  def create_user attrs = {}

    attrs2 = attrs.dup
    random = Random.rand(42-10)
    attrs2[:email]  = attrs[:email] || "email#{random}@localhost.es"
    attrs2[:password] = attrs[:password] || "password"
    attrs2[:password_confirmation]  = attrs[:password_confirmation] || "password"
    user = User.new attrs2
    user.save
    user

  end



  def create_sample_users
    create_user(:email => "guest@example.com",
                :password => "guest123",
                :password_confirmation => "guest123",

                )

  end




  def create_gadget (attrs = {})

    attrs2 = attrs.dup
    random = Random.rand(42-10)
    attrs2[:name]       = attrs[:title]       || "Título de prueba #{random}  "
    attrs2[:description] = attrs[:description]      || "descripción de prueba #{random} "
    attrs2[:user_id] = attrs[:user_id]        || User.last.id
    gadget = Gadget.create attrs2
    
    gadget.save
    # return the created object
    gadget

  end

  def create_image attrs = {}



  end


end