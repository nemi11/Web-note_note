class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable #←追記する

  has_many :notes, dependent: :destroy
end