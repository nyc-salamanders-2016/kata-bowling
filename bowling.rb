gamestring = ARGV[0]

def parseroll(c)
  case c
  when "X", "/"
    10
  when "-"
    0
  else
    c.to_i
  end
end

# def score(str)
#   return 0 if str == ''
#   frame_score = parseroll(str[0])
#   str[0] = ''
#   return 10+parseroll(str[0])+parseroll(str[1]) if frame_score == 10 && str.length == 2
#   return 10+parseroll(str[0]) if frame_score == 10 && str.length == 1
#   return 10+parseroll(str[0])+parseroll(str[1]) + score(str) if frame_score == 10
#   frame_score = parseroll(str[0]) < 10 ? frame_score + parseroll(str[0]) : 10
#   str[0] = ''
#   return 10+parseroll(str[0]) if frame_score == 10 && str.length == 1
#   return 10+parseroll(str[0]) + score(str) if frame_score == 10
#   frame_score + score(str)
# end

def score(str)
  return 0 if str == ''
  case str
  when /\AX[\dX\/]{2}/
    return 10 + parseroll(str[1]) + parseroll(str[2]) if str.length == 3
    10 + parseroll(str[1]) + parseroll(str[2]) + score(str[1..-1])
  when /\A\d\/[\dX\/]/
    return 10 + parseroll(str[2]) if str.length == 3
    10 + parseroll(str[2]) + score(str[2..-1])
  else
    str[0].to_i + str[1].to_i + score(str[2..-1])
  end
end
