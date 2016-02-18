ActiveAdmin.register User do

 actions :index, :show, :destroy

 index do
   selectable_column
   id_column
   column :email
   column :last_sign_in_at
   column :created_at
   column :updated_at
   actions
 end


end
