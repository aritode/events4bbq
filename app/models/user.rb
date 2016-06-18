class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Юзверь №#{rand(777)}" if self.name.blank?
  end
end
