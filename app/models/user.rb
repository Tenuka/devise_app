class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :lockable, :validatable

    has_many :books, dependent: :destroy
    has_many :rates, dependent: :destroy
    has_many :annotations, dependent: :destroy

    validates :name, presence: true, length: { maximum: 50 }
end
