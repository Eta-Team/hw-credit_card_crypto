# frozen_string_literal: true

# Substitution Ciphers
module SubstitutionCipher
  # Caesar Ciphers
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
    end
  end

  # Permutation Cipher
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      random_shuffle = (0..127).to_a.shuffle(random: Random.new(key))
      document_to_chars = document.to_s.chars
      document_to_chars.map { |c| random_shuffle.at(c.ord).chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher

      random_shuffle = (0..127).to_a.shuffle(random: Random.new(key))
      document_to_chars = document.to_s.chars
      document_to_chars.map { |c| random_shuffle.index(c.ord).chr }.join
    end
  end
end
