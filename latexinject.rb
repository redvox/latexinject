#def method_missing(m, *args, &block)  
#   puts "There's no method called #{m} here."  
#end

def newpage input, order, output
    output.write("<!-- \\newpage -->\n")
end

def sequencediagram input, order, output
    output.write("<!--\n")
    output.write("\\begin{sequencediagram}\n")
    stack = Array.new
    depth = Array.new

    while line = input.gets
        break if line.scan(/\[(.*?)\]/).include? ["sequencediagram"]
        s = String.new

        currentDepth = line[/\A */].size

        puts ""
        puts stack
        

        if !stack.empty? && !line.empty? then
            copy = Array.new(depth)
            copy.each do |depthlv|
                if depthlv >= currentDepth then  
                    d = depth.pop
                    s << " "*d
                    s << stack.pop
                    puts "pop" << s
                end
            end
        end

        case
            # \ newinst [1]{ c }{: C }
            when !(instance = line.scan(/\A:(\w+)\[/)).empty?
                s << "\\newinst"
                param = line.scan(/\[(\w+)\]/)
                s << "["<<param[1].to_s<<"]" if param[1]
                s << "{"<<param[0].to_s<<"}"
                s << "{:"<<instance.to_s<<"}"

            # \ newthread [ blue ]{ b }{: Blue }
            when !(instance = line.scan(/\A(\w+)\[/)).empty?
                s << "\\newthread"
                param = line.scan(/\[(\w+)\]/)
                s << "["<<param[1].to_s<<"]" if param[1]
                s << "{"<<param[0].to_s<<"}"
                s << "{"<<instance.to_s<<"}"

            #\ begin { messcall }{ t }{ function () }{ i}
            #\ end { messcall }
            when !(call = line.scan(/(\S+)\->>(\S+)\s*\:\s*([^:]*):\s*(.*)/)).empty?
                stack.push("\\end{messcall}\n")
                depth.push(currentDepth)
                s << " "*currentDepth
                s << "\\begin{messcall}"
                s << "{" << call[0][0].to_s << "}"
                s << "{" << call[0][2].to_s << "}"
                s << "{" << call[0][1].to_s << "}"
                s << "{" << call[0][3].to_s << "}"

            #\ begin { call }{ t }{ function () }{ i }{ return value }
            #\ end { call }
            when !(call = line.scan(/(\S+)->(\S+)\s*\:\s*([^:]*):\s*(.*)/)).empty?
                stack.push("\\end{call}\n")
                depth.push(currentDepth) 
                s << " "*currentDepth
                s << "\\begin{call}"
                s << "{" << call[0][0].to_s << "}"
                s << "{" << call[0][2].to_s << "}"
                s << "{" << call[0][1].to_s << "}"
                s << "{" << call[0][3].to_s << "}"

            #\ begin { callself }{ t }{ function () }{ return value }
            #\ end { callself }
            when !(call = line.scan(/->(\S+)\s*\:\s*([^:]*):\s*(.*)/)).empty?
                stack.push("\\end{callself}\n")
                depth.push(currentDepth)
                s << " "*currentDepth
                s << "\\begin{callself}"
                s << "{" << call[0][0].to_s << "}"
                s << "{" << call[0][2].to_s << "}"
                s << "{" << call[0][1].to_s << "}"

            #\ begin { sdblock }{ Block }{ description }
            #\ end { sdblock }
            when !(call = line.scan(/\loop\s+(\S+)\s+(\S+)/)).empty?
                stack.push("\\end{sdblock}\n")
                depth.push(currentDepth)
                s << " "*currentDepth
                s << "\\begin{sdblock}"
                s << "{" << call[0][0].to_s << "}"
                s << "{" << call[0][1].to_s << "}"

            #else
              #  puts line
        end

        output.write(s<<"\n")
    end

    while !stack.empty? 
        output.write(stack.pop)
    end

    output.write("\\end{sequencediagram}\n")
    output.write("-->\n")
end

#### State
$state = {}

indicator = 91

#### Begin
raise "Wrong amount of arguments" if ARGV.size != 2

begin
    input = File.new(ARGV[0], "r")
    output = File.new(ARGV[1], "w")
rescue => err
    puts "Exception: #{err}"
    err
end

begin
    while line = input.gets
        if line[0] == indicator
            order = line.scan(/\[(.*?)\]/)
            self.send(order[0].to_s.to_sym, input, order, output)
        else
            output.write(line)
        end
    end
    input.close
rescue => err
    puts "Exception: #{err}"
    err
end