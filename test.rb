short_story = "これからは毎朝6時に起きる。起きたイな。\r\nなぜなら朝起きる練習が必要だからです。"

contents = []

buffer = ""

short_story.each_char do |s|
	p s
	if s == "\r"
		buffer << s
		# do nothing
	elsif s == "\n"
		contents.push buffer
		buffer << s
		buffer = ""
	elsif buffer.length >= 10
		contents.push buffer
		buffer = s
	else
		buffer << s
	end
end
p contents