# coding: utf-8

class Player < Sprite#スプライト機能を持たせる
  def update#独立した動き
    self.x += Input.x*4#キーボード動き
    self.y += Input.y*4
  end
end