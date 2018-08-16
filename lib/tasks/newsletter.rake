    desc "Envoi de la newsletter toutes les semaines !"
    task newsletter: :environment do
    @users = User.all
    while 1 == 1 do
        @users.each do |user|
        UserMailer.with(user).welcome_email.deliver_now
        end
      sleep(1209600)
    end
    end
