# coding: utf-8

class Enemy < Sprite#スプライト継承
  attr_accessor :deleat
  def initialize(x,y,img)
  super 
  @deleat=false
  end
  def update
    self.y += 1#自分自身のｙを一ずつ変更　下へ
    if self.y >= Window.height - self.image.height#下に届いたとき
    self.x = rand(800)
    self.y = rand(600)
      #self.vanish#消す
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish#衝突したら消える
    self.deleat=true
  end
end