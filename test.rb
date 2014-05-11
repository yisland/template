require 'yaml'
require 'csv'

TEMPLATE = YAML.load_file("template.yml")

TMPVAL = TEMPLATE["default"]["template"]
REPARRAY = TEMPLATE["default"]["replace"]
TMPFILENAME = TEMPLATE["default"]["csvFileName"]
OUTFILENAME = Dir::pwd + File::SEPARATOR + "tst.txt"

outArray = []

CSV.foreach(TMPFILENAME, { :encoding => "UTF-8"}) do |row|
    i = 0
    tmp = TMPVAL
    row.each do |column|
        tmp = tmp.gsub(REPARRAY[i], column)
        i += 1
    end
    outArray.push tmp
end

File.open(OUTFILENAME, 'w') do |f|
    outArray.each do |item|
        f.write item + "\n"
    end
end