require 'yaml'
require 'csv'
require 'fileutils'

SETTING = YAML.load_file("setting.yml")

TMPFILEPATH = SETTING["default"]["templateFile"]
REPARRAY = SETTING["default"]["replace"]
CSVFILENAME = SETTING["default"]["csvFileName"]
OUTFILENAME = SETTING["default"]["outputFileName"]
FOMATTER = SETTING["default"]["fomatter"]
STRIPCASE = SETTING["default"]["stripCase"]

outArray = []
csvArray = []

File.open(CSVFILENAME).each do |csv|
    csvArray.push csv
end

i = 0
csvArray.each do
    csvColumn = csvArray[i].split(",")
    File.open(TMPFILEPATH) do |row|
        tmp = row.read

        j = 0
        csvColumn.each do |word|
            # 大文字・小文字変換
            if FOMATTER == "lower" then
                word.downcase!
            elsif FOMATTER == "up" then
                word.upcase!
            elsif FOMATTER == "cap" then
                word.capitalize!
            end

            # 空白削除
            word.strip! if STRIPCASE

            tmp.gsub!(REPARRAY[j], word)
            j += 1
        end
        
        outArray.push tmp
    end
    i += 1
end

FileUtils.mkdir_p(File::dirname(OUTFILENAME)) unless FileTest.exists?(OUTFILENAME)
File.open(OUTFILENAME, 'w') do |f|
    outArray.each do |item|
        f.write item + "\n"
        puts item
    end
end