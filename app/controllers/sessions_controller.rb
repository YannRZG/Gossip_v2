class SessionsController < ApplicationController
  #ici
  def new
  # Créer une nouvelle instance vide d'utilisateur (si nécessaire)
  @user = User.new
  end


  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Vous êtes connecté avec succès !'
      redirect_to root_path  # Rediriger vers la page welcome/index
    else
      flash.now[:danger] = 'Adresse e-mail ou mot de passe incorrect.'
      render :new
    end
  end

  def destroy
  session[:user_id] = nil
  flash[:succes] = 'you have successfully logged out.'
  redirect_to root_path
  end
end
