# coding: utf-8

class Player < Sprite#�X�v���C�g�@�\����������
  def update#�Ɨ���������
    self.x += Input.x*4#�L�[�{�[�h����
    self.y += Input.y*4
  end
end