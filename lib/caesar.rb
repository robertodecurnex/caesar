# Caesar Cipher
# 
# encode/decode any string using the Caesar Cipher method.
# 
# Usage:
#   Caesar.encode('A', 'CAESAR') #=> "CAESAR"
#   Caesar.encode('R', 'CAESAR') #=> "TRVJRI"
#
#   Caesar.decode('A', 'CAESAR') #=> "CAESAR"
#   Caesar.decode('R', 'TRVJRI') #=> "CAESAR" 
# 

module Caesar
  A_OFFSET = 65 #'A'.unpack('C').first
  Z_OFFSET = 90 #'Z'.unpack('C').first

  def Caesar.encode(key, plain_text)
    key_offset = key.upcase.unpack('C').first

    cipher_text = plain_text.upcase.split('').collect do |letter| 
      cipher_letter = (letter.unpack('C').first + key_offset - A_OFFSET)
      if cipher_letter > Z_OFFSET
        cipher_letter -= ( Z_OFFSET - A_OFFSET + 1 )
      end
      cipher_letter.chr
    end

    return cipher_text.join
  end

  def Caesar.decode(key, cipher_text)
    key_offset = key.upcase.unpack('C').first

    plain_text = cipher_text.split('').collect do |cipher_letter|
      if !('A'..'Z').include?(cipher_letter)
        cipher_letter
      else
        if cipher_letter.unpack('C').first >= key_offset
          letter = cipher_letter.unpack('C').first - key_offset
        else
          letter = (cipher_letter.unpack('C').first + (Z_OFFSET - A_OFFSET + 1)) - key_offset
        end
        letter += A_OFFSET
        letter.chr
      end
    end

    return plain_text.join
  end
end

