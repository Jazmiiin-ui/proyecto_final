class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Establecer la relación con las órdenes
  has_many :orders

  ROLES = %w[admin cliente].freeze
  
  validates :role, inclusion: { in: ROLES }, allow_nil: true

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= 'cliente' # Asignar el rol por defecto
  end
end
