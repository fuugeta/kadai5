# coding: utf-8
require 'dxruby'#ウィンドウ

require_relative 'player'#このファイルを読み込んでね
require_relative 'enemy'

Window.width  = 800#大きさ変更
Window.height = 600

font = Font.new(100)
font1 = Font.new(50)
font2 = Font.new(20)

player_img = Image.load("player.png")#画像選択
player_img.setColorKey([0, 0, 0])#黒を透明にできる

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)#スプライトクラス継承

enemies = []#右辺のものを順番に配列に入ってく
30.times do#10体出てくる
  enemies << Enemy.new(rand(800), rand(600), enemy_img)#乱数
end
count=0

Window.loop do
  break if Input.keyPush?(K_ESCAPE)#エスケープで終わり
  enemies.each{|enemy|
  if enemy.deleat
  count+=1
  enemy.deleat=false
  end
  }
  Window.draw_font(50,50,"天使でドクロを\n滅しましょう",font2)
  if count>=30
  Window.draw_font(150,260,"Game Clear",font)
  Window.draw_font(250,350,"Escで終了",font1)
  
  end
  Sprite.update(enemies)#敵の位置を更新して描画
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  Sprite.check(player, enemies)
end