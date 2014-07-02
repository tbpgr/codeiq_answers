String.prototype.repeat = function(count) {
  return Array(count + 1).join(this);
};

/*
動作確認用のHTMLです。

repeatの他に
半角小文字のエックスを乗算記号に見立てたバージョン、
日本語の「かける」をメソッド名にしたバージョンも作ってみました。

<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Repeat</title>
  <script language="JavaScript"><!--
  String.prototype.repeat = function(count) {
    return Array(count + 1).join(this);
  };
  String.prototype.x = function(count) {
    return Array(count + 1).join(this);
  };
  String.prototype.かける = function(count) {
    return Array(count + 1).join(this);
  };
  --></script>
</head>
<body>
  <script language="JavaScript"><!--
    document.write('w'.repeat(10) + 'v' + 'w'.repeat(20));
    document.write('<br />')
    document.write('w'.x(10) + 'v' + 'w'.x(20));
    document.write('<br />')
    document.write('w'.かける(10) + 'v' + 'w'.かける(20));
  --></script>
</body>
</html>

以下、それぞれの出力結果
wwwwwwwwwwvwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwvwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwvwwwwwwwwwwwwwwwwwwww
*/