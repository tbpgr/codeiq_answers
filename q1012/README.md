# 中学入試から：数列の和 問題の解答
## 構成
|パス|内容|
|:--|:--|
|lib/nabe_arithmetic.rb                     |プロダクトコード|
|spec/nabe_arithmetic_spec.rb               |id = T01-T30 をもとに機能を実装するためのテスト|
|spec/nabe_arithmetic_answer_spec.rb        |id = 1-1000 をもとに解答を導くためのテスト|
|spec/spec_helper.rb                        |rspecのヘルパー。|

## その他、解答コードを作成する過程で作ったツール

* list_spec_generator.rb
* sum_spec_generator.rb
* sum_answer_spec_generator.rb

問題に添付されていた、data.txtからコピーした情報を元に
テストケース部のソースコードを生成するツール。
使い捨てのツールなので可読性や保守性やDRYについてはあまり考慮していない。
