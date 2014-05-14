require 'yaml'
require 'csv'
require 'fileutils'

TEMPLATE = YAML.load_file("template.yml")

TMPVAL = TEMPLATE["default"]["template"]
REPARRAY = TEMPLATE["default"]["replace"]
TMPFILENAME = TEMPLATE["default"]["csvFileName"]
OUTFILENAME = TEMPLATE["default"]["outputFileName"]
LOWORUPCASE = TEMPLATE["default"]["lowOrUpCase"]
STRIPCASE = TEMPLATE["default"]["stripCase"]

outArray = []

CSV.foreach(TMPFILENAME, { :encoding => "UTF-8"}) do |row|
    i = 0
    tmp = TMPVAL
    row.each do |column|
        # 大文字・小文字変換
        if LOWORUPCASE == "lower" then
            column.downcase!
        elsif LOWORUPCASE == "up" then
            column.upcase!
        end

        # 空白削除
        column.strip! if STRIPCASE

        tmp = tmp.gsub(REPARRAY[i], column)
        i += 1
    end
    outArray.push tmp
end

FileUtils.mkdir_p(File::dirname(OUTFILENAME)) unless FileTest.exists?(OUTFILENAME)
File.open(OUTFILENAME, 'w') do |f|
    outArray.each do |item|
        f.write item + "\n"
        puts item
    end
end