template
========

## setting.yml設定
templateFile: テンプレートファイルの場所　　　　  

    replace:  テンプレート置き換え文字  
        - "#1"  
        - "#2"  

csvFileName:　　　　test.csv  置き換えたい文字ファイル名　CSV形式  
outputFileName:　　tst.txt  出力ファイル名  
fomatter:          up　　大文字・小文字・先頭変換　　例)　up 大文字　lower　小文字　cap　先頭大文字  
stripCase: false　　空白を削除するか　　　　例）　true  削除　false　削除しない

## 実行方法
```ruby
ruby test.rb
```