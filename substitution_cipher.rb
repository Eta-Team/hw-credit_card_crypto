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
    def self.string_array_of_numbers(document)
      document.to_s.chars.map do |letter|
        (letter.downcase.ord - 'a'.ord + 1)
      end
    end

    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      arr = string_array_of_numbers(document)
      arr.map { |number| ((((number + key) % 94) % 94) + 'a'.ord - 1).chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      arr = string_array_of_numbers(document)
      arr.map { |number| ((((number - key) % 94) % 94) + 'a'.ord - 1).chr }.join
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
