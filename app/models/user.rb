require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates_length_of :password, :within => 4..40
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_presence_of :username, :email, :password

  before_create :initialize_salt, :encrypt_password

  def encrypt(string)
    generate_hash("--#{password_salt}--#{string}--")
  end

  protected

    def generate_hash(string)
      Digest::SHA1.hexdigest(string)
    end

    def initialize_salt
      if new_record?
        self.password_salt = generate_hash("--#{Time.now.to_s}--#{email}--")
      end
    end

    def encrypt_password
      return if password.blank?
      self.encrypted_password = encrypt(password)
    end
end
