require 'yaml'
require 'csv'

TEMPLATE = YAML.load_file("template.yml")

TMPVAL = TEMPLATE["default"]["template"]
REPARRAY = TEMPLATE["default"]["replace"]
TMPFILENAME = TEMPLATE["default"]["csvFileName"]
OUTFILENAME = Dir::pwd + File::SEPARATOR + TEMPLATE["default"]["outputFileName"]
LOWORUPCASE = TEMPLATE["default"]["lowOrUpCase"]

outArray = []

CSV.foreach(TMPFILENAME, { :encoding => "UTF-8"}) do |row|
    i = 0
    tmp = TMPVAL
    row.each do |column|
        if LOWORUPCASE == "lower" then
            column.downcase!
        elsif LOWORUPCASE == "up" then
            column.upcase!
        end
        tmp = tmp.gsub(REPARRAY[i], column)
        i += 1
    end
    outArray.push tmp
end

File.open(OUTFILENAME, 'w') do |f|
    outArray.each do |item|
        f.write item + "\n"
        puts item
    end
end