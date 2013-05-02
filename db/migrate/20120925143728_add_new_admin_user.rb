class AddNewAdminUser < ActiveRecord::Migration
  def up
    @user = User.new(
        :email => "admin@example.com",
        :password => "password",
        :password_confirmation => "password"
    )

    @user.save!
  end

  def down
  end
end
