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
    new_key = Base64.decode64(key)
    simple_box = RbNaCl::SimpleBox.from_secret_key(new_key)
    # secret_box = RbNaCl::SecretBox.new(new_key)
    Base64.strict_encode64(simple_box.encrypt(document.to_s))
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    encoded_text = Base64.strict_decode64(encrypted_cc)
    new_key = Base64.decode64(key)
    secret_box = RbNaCl::SimpleBox.from_secret_key(new_key)
    secret_box.decrypt(encoded_text)
  end
end
