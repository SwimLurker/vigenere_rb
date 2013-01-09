class Vigenere
	def main(args)
		if args.length != 3
			printUsage
		elsif args[0] == '-e'
			puts encrypt(args[1], args[2])
		elsif args[0] == '-d'
			puts decrypt(args[1], args[2])
		else
			printUsage
		end
	end
	
	def printUsage
		puts 'Usage: main -e <srouce string> <cipher> //Encrypt source string with the cipher by vigenere algorithm;'
		puts '       main -d <encrypted string> <cipher> //Decrypt encrypted string with the cipher by vigenere algorithm;'
	end
	
	def encrypt(srcStr,cipher)
	  j = 0
	  result = ''
	  for i in 0..(srcStr.length-1) do
	    c = srcStr.upcase[i]
	    if isUpperLetter(c)
	      result.concat(encryptChar(c, cipher[j]).chr)
	      j =(j+1)%cipher.length
      else
        result.concat(' ')
	    end
	  end
	  return result
	end
	
	def encryptChar(sc, cc)
	  (((sc.ord- ('A'.ord)) + (cc.ord - ('A'.ord))) % 26) + ('A'.ord)
	end
	
	def decrypt(encStr,cipher)
    j = 0
    result = ''
    for i in 0..(encStr.length-1) do
      c = encStr.upcase[i]
      if isUpperLetter(c)
        result.concat(decryptChar(c, cipher[j]).chr)
        j = (j + 1) % cipher.length
      else
        result.concat(' ')
      end
    end
    return result
  end
  
  def decryptChar(ec, cc)
    (((ec.ord + 26) - cc.ord) % 26) + 'A'.ord
  end
  
  def isUpperLetter(c)
    if((c >= 'A') and (c <= 'Z'))
      true
    end
  end
	
end

vig = Vigenere.new
vig.main(ARGV)