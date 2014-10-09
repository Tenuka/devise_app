class User < ActiveRecord::Base
  extend Enumerize
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :lockable, :validatable

  has_many :books, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :annotations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  enumerize :role, in: [:admin, :user], predicates: true, default: :user

end
