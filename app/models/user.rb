class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :diaries, class_name: "Diary", dependent: :destroy
  has_many :foods_meal, dependent: :destroy
  has_many :foods, class_name: "Food", dependent: :destroy
end
