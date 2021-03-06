class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(target)
    attack_num = rand(4)

    if attack_num == 0
      p "#{self.name}の必殺技"
      damege = calculate_special_attack - target.defense
    else
      p "#{self.name}の攻撃"
      damege = self.offense - target.defense
    end

    target.hp -= damege

    p <<~TEXT
      #{self.name}は#{target.name}に#{damege}のダメージを与えた
      #{target.name}の残りHPは#{target.hp}だ
    TEXT
  end

  def calculate_special_attack
    self.offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

brave = Brave.new(name: '勇者', hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: 'スライム', hp: 250, offense: 200, defense: 100)

brave.attack(monster)







