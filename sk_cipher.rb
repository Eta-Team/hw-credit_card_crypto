# frozen_string_literal: true

require 'base64'
require 'rbnacl'
# Module to implement modern encryption
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    Base64.encode64(RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes))
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    secret_box = RbNaCl::SecretBox.new(key)
    Base64.strict_encode64(secret_box.encrypt(document.to_s))
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    encoded_text = Base64.strict_decode64(encrypted_cc)
    secret_box = RbNaCl::SecretBox.new(key)
    secret_box.decypt(encoded_text)
  end
end
