class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :comics
         validates :username, presence: true
  has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\z/
end
