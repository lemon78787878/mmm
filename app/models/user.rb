class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validate :password_complexity

  has_many :diaries

  private
  def password_complexity
    return if password.nil? || password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)

    errors.add :password, 'は半角英数字混合で入力してください'
  end
end
