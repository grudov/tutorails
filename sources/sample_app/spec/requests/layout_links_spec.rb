require 'spec_helper'

describe "LayoutLinks" do
  
  describe "GET /layout_links" do
    it "devrait trouver une page Accueil a '/'" do
      get '/'
      response.should have_selector('title', :content => "Accueil")
    end

    it "devrait trouver une page Contact at '/contact'" do
      get '/contact'
      response.should have_selector('title', :content => "Contact")
    end

    it "should have an a Propos page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "A Propos")
    end

    it "devrait trouver une page aide a '/help'" do
      get '/help'
      response.should have_selector('title', :content => "Aide")
    end

    it "devrait avoir une page d'inscription a '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Inscription")
    end
  end
  
  describe "quand pas identifie" do
    
    it "doit avoir un lien de connexion" do
      visit root_path
      response.should have_selector("a", href: signin_path, content: "S'identifier")
    end
    
  end
  
  describe "quand identifie" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in "Email", with: @user.email
      fill_in "Mot de passe", with: @user.password
      click_button
    end
    
    it "devrait avoir un lien de deconnexion" do
      visit root_path
      response.should have_selector("a", href: signout_path, content: "Deconnexion")
    end
    
    it "devrait avoir un lien vers le profil" do
      visit root_path
      response.should have_selector("a", href: edit_user_path(@user), content: "Profil")
    end
    
  end
  
end
