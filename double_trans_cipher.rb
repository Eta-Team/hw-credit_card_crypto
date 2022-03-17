module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    document = document.to_s
    document += ' ' while find_rows_cols(document).nil?
    response = find_rows_cols(document)
    rows = response[0]
    columns = response[1]
    matrix = get_matrix(document, rows, columns)
    matrix.shuffle(random: Random.new(key)).join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    response = find_rows_cols(ciphertext)
    matrix = get_matrix(ciphertext, response[0], response[1])
    get_plain_text(matrix, key)
  end

  def self.find_rows_cols(document)
    length = document.to_s.length
    multiple_qty = Math.sqrt(length) + 2
    a = 2

    (2..multiple_qty).each do |i|
      if (length % i).zero?
        return [a, i] if i * a == length

        a = i
      end
      return [a, i] if i * a == length
    end
    nil
  end

  def self.get_matrix(document, rows, columns)
    encrypted_arr = Array.new(rows) { [] }
    doc = document.chars
    i = 0
    (0...rows).each do |j|
      (0...columns).each do |k|
        encrypted_arr[j][k] = doc[i]
        i += 1
      end
    end
    encrypted_arr
  end

  def self.get_plain_text(matrix, key)
    matrix_order = (0...matrix.length).to_a.shuffle(random: Random.new(key))
    matrix.sort_by.with_index { |_, k| matrix_order[k] }.join
  end
end
