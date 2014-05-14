template
========

## template.yml設定
template: テンプレート文字列　　　　例)　test#1test#2  

    replace:  テンプレート置き換え文字  
        - "#1"  
        - "#2"  

csvFileName:　　　　test.csv  置き換えたい文字ファイル名　CSV形式  
outputFileName:　　tst.txt  出力ファイル名  
lowOrUpCase: up　　大文字・小文字変換　　　　例)　up 大文字　lower　小文字  
stripCase: false　　空白を削除するか　　　　例）　true  削除　false　削除しない

## 実行方法
```ruby
ruby test.rb
```