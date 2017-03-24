
def chapter_number
	chapter = gets.chomp.to_i
	@chapters = Array.new(chapter)
	unless chapter.is_a?Integer
		chapter_number
	end
end

def chapter_names
	@chapters.each_index {|x| 
		puts "Chapter #{x +1}?"
		title = gets.chomp
		puts "And what's the page number?"
		page = gets.chomp
		@chapters[x] = {page: page, title: title}
	}
end

def table_maker
	header = "Table of contents"

	puts(header.center(50)) 
	@chapters.each_index {|x| 
		chapter = "Chapter #{x + 1}"
		title = @chapters[x][:title]
		page = @chapters[x][:page]
		puts chapter + "    " + title + (page.rjust(50))
	}
end

puts "How many chapters?"
chapter_number
puts "Great! What are they called?"
chapter_names
puts "Thanks. Here's your Table of Contents!"
table_maker

