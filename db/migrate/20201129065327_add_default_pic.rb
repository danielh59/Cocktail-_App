class AddDefaultPic < ActiveRecord::Migration
  def change
    change_column_default :drinks, :pic, 'https://st.depositphotos.com/2346379/3459/i/600/depositphotos_34591677-stock-photo-cocktails.jpg'
  end
end
