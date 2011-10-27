require 'digest/md5'

=begin
引数のURLから62進数のハッシュを生成し、6文字ずつを配列に格納して返す.
返した値のどれかを重複チェックして短縮URLに使うといいよ.
=end
def url_shorter(url)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a

  output = Digest::MD5.hexdigest(url).scan(/.{8}/).map do |h|
    int = h.hex
    out = ''
    6.times do
      val = 0x0000003D & int
      out << chars[val]
      int = int >> 5
    end
    out
  end
end

puts url_shorter 'http://sanojimaru.com'
