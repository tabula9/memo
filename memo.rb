require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp
  
  puts "メモしたい内容を記入してください"
  puts "完了したらCntl + Dを押します"

  memo_content = readlines


  class Input
    def initialize(name,content)
      @name = name
      @content = content
    end
  
    def call_csv
      CSV.open("#{@name}.csv","w") do |test|
        test << @content
      end
    end
  end


  type1 = Input.new(memo_name,memo_content)
  type1.call_csv()
  
elsif memo_type == 2
  puts "編集したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp
  
  puts "メモの編集をしてください"
  puts "完了したらCntl + Dを押します"
  
  class Edit
    def initialize(name,content)
      @name = name
      @content = content
    end
    
    def edit_csv
      CSV.open("#{@name}.csv","a") do |test|
        test << @content
      end
    end
    
  end
  
  class Read
    def initialize(name)
      @name = name
    end
    
    def read_csv
      CSV.open("#{@name}.csv") do |csv|
        csv.each do |row|
          puts row
        end
      end
    end
  end
  
  reader = Read.new(file_name)
  reader.read_csv()
    
  edit_content = readlines
  type2 = Edit.new(file_name,edit_content)
  type2.edit_csv()
end
